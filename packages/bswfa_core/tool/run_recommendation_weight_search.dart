import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;

import 'recommendation_search_weight_tools.dart';

Future<void> main(List<String> args) async {
  final _CliOptions options = _CliOptions.parse(args);
  final Stopwatch totalStopwatch = Stopwatch()..start();

  stdout.writeln('Loading dataset from ${options.datasetFile.path}');
  final List<DatasetEntry> rawEntries = loadDatasetEntries(options.datasetFile);
  stdout.writeln('Loaded ${rawEntries.length} dataset entries');

  stdout.writeln('');
  stdout.writeln('Phase 1/2: preparing oracle and candidate pools');
  final Stopwatch preparationStopwatch = Stopwatch()..start();
  final List<PreparedDatasetEntry> preparedEntries = prepareDatasetEntries(
    rawEntries,
    onProgress: (int completed, int total, String label) {
      _printProgress(
        phase: 'prepare',
        completed: completed,
        total: total,
        label: label,
        stopwatch: preparationStopwatch,
        every: options.progressEvery,
      );
    },
  );
  preparationStopwatch.stop();
  stdout.writeln(
    'Preparation complete in ${_formatDuration(preparationStopwatch.elapsed)}',
  );

  final List<PreparedDatasetEntry> trainEntries = preparedEntries
      .where(
        (PreparedDatasetEntry entry) => entry.entry.split == options.trainSplit,
      )
      .take(options.maxTrainEntries ?? 1 << 30)
      .toList(growable: false);
  final List<PreparedDatasetEntry> validationEntries = preparedEntries
      .where(
        (PreparedDatasetEntry entry) =>
            entry.entry.split == options.validationSplit,
      )
      .toList(growable: false);
  final List<PreparedDatasetEntry> holdoutEntries = preparedEntries
      .where(
        (PreparedDatasetEntry entry) =>
            entry.entry.split == options.holdoutSplit,
      )
      .toList(growable: false);

  if (trainEntries.isEmpty ||
      validationEntries.isEmpty ||
      holdoutEntries.isEmpty) {
    throw StateError(
      'Train/validation/holdout splits must all be non-empty for the full run.',
    );
  }

  stdout.writeln(
    'Train=${trainEntries.length}, validation=${validationEntries.length}, '
    'holdout=${holdoutEntries.length}',
  );

  stdout.writeln('');
  stdout.writeln(
    'Phase 2/2: searching ${options.trials} weight sets '
    '(profile=${options.profileName}, seed=${options.seed}, workers=${options.workers})',
  );

  final Stopwatch searchStopwatch = Stopwatch()..start();
  final List<_SearchResult> bestResults = <_SearchResult>[];

  final _SearchResult baselineResult = _evaluateWeights(
    const SearchWeights(
      genericLeader: 0.331,
      regularUnit: 1.0,
      eliteUnit: 1.330,
      specialEliteUnit: 2.053,
      surpriseAttack: 0.216,
      settlementLevel: 2.399,
    ),
    trainEntries,
    validationEntries,
    holdoutEntries,
  );
  _insertBestResult(bestResults, baselineResult, options.keepBest);

  final List<_WorkerSpec> workerSpecs = _buildWorkerSpecs(
    options.trials,
    options.workers,
  );
  final Map<int, int> completedByWorker = <int, int>{
    for (final _WorkerSpec spec in workerSpecs) spec.workerId: 0,
  };
  final ReceivePort receivePort = ReceivePort();
  final List<Isolate> isolates = <Isolate>[];

  for (final _WorkerSpec spec in workerSpecs) {
    final _WorkerRequest request = _WorkerRequest(
      sendPort: receivePort.sendPort,
      workerId: spec.workerId,
      trials: spec.trials,
      keepBest: options.keepBest,
      seed: options.seed + (spec.workerId * 1000003),
      searchSpace: options.searchSpace,
      trainEntries: trainEntries,
      validationEntries: validationEntries,
      holdoutEntries: holdoutEntries,
      progressEvery: options.progressEvery,
    );
    isolates.add(await Isolate.spawn<_WorkerRequest>(_workerMain, request));
  }

  int finishedWorkers = 0;
  await for (final Object? rawMessage in receivePort) {
    final Map<Object?, Object?> message = rawMessage! as Map<Object?, Object?>;
    final String type = message['type']! as String;

    if (type == 'progress') {
      completedByWorker[message['workerId']! as int] =
          message['completed']! as int;
      final int totalCompleted = completedByWorker.values.fold(
        0,
        (int total, int value) => total + value,
      );
      _printProgress(
        phase: 'search',
        completed: totalCompleted,
        total: options.trials,
        label:
            'best validation score=${bestResults.first.validation.optimizationScore.toStringAsFixed(4)}',
        stopwatch: searchStopwatch,
        every: options.progressEvery,
        force: true,
      );
      continue;
    }

    if (type == 'result') {
      final List<Object?> rawResults = message['results']! as List<Object?>;
      for (final Object? rawResult in rawResults) {
        _insertBestResult(
          bestResults,
          _parseSearchResult(rawResult! as Map<Object?, Object?>),
          options.keepBest,
        );
      }
      finishedWorkers++;
      if (finishedWorkers == workerSpecs.length) {
        receivePort.close();
        break;
      }
    }
  }
  searchStopwatch.stop();

  final _SearchResult best = bestResults.first;

  stdout.writeln('');
  stdout.writeln(
    'Search complete in ${_formatDuration(searchStopwatch.elapsed)}',
  );
  stdout.writeln('Total elapsed: ${_formatDuration(totalStopwatch.elapsed)}');

  stdout.writeln('');
  stdout.writeln('Best candidates:');
  for (int index = 0; index < bestResults.length; index++) {
    final _SearchResult result = bestResults[index];
    stdout.writeln('Rank ${index + 1}');
    stdout.writeln('  weights: ${result.weights}');
    stdout.writeln(
      '  train: score=${result.train.optimizationScore.toStringAsFixed(4)} '
      'recall=${result.train.averageRecallAtK.toStringAsFixed(4)} '
      'top3=${result.train.averageTop3Overlap.toStringAsFixed(4)} '
      'gap=${result.train.averageBestWinGap.toStringAsFixed(4)}',
    );
    stdout.writeln(
      '  validation: score=${result.validation.optimizationScore.toStringAsFixed(4)} '
      'recall=${result.validation.averageRecallAtK.toStringAsFixed(4)} '
      'top3=${result.validation.averageTop3Overlap.toStringAsFixed(4)} '
      'gap=${result.validation.averageBestWinGap.toStringAsFixed(4)}',
    );
    stdout.writeln(
      '  holdout: score=${result.holdout.optimizationScore.toStringAsFixed(4)} '
      'recall=${result.holdout.averageRecallAtK.toStringAsFixed(4)} '
      'top3=${result.holdout.averageTop3Overlap.toStringAsFixed(4)} '
      'gap=${result.holdout.averageBestWinGap.toStringAsFixed(4)}',
    );
  }

  stdout.writeln('');
  stdout.writeln('FINAL_RESULT_START');
  stdout.writeln('weights: ${best.weights}');
  stdout.writeln(
    'train_score: ${best.train.optimizationScore.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'validation_score: ${best.validation.optimizationScore.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'holdout_score: ${best.holdout.optimizationScore.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'validation_recall: ${best.validation.averageRecallAtK.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'holdout_recall: ${best.holdout.averageRecallAtK.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'validation_top3: ${best.validation.averageTop3Overlap.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'holdout_top3: ${best.holdout.averageTop3Overlap.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'validation_gap: ${best.validation.averageBestWinGap.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'holdout_gap: ${best.holdout.averageBestWinGap.toStringAsFixed(4)}',
  );
  stdout.writeln('FINAL_RESULT_END');
}

class _CliOptions {
  const _CliOptions({
    required this.datasetFile,
    required this.trials,
    required this.seed,
    required this.keepBest,
    required this.trainSplit,
    required this.validationSplit,
    required this.holdoutSplit,
    required this.maxTrainEntries,
    required this.searchSpace,
    required this.profileName,
    required this.progressEvery,
    required this.workers,
  });

  factory _CliOptions.parse(List<String> args) {
    String datasetPath = 'tool/recommendation_weight_dataset.json';
    int trials = 1000;
    int seed = 42;
    int keepBest = 10;
    String trainSplit = 'train';
    String validationSplit = 'validation';
    String holdoutSplit = 'holdout';
    int? maxTrainEntries;
    SearchSpaceProfile searchSpace = SearchSpaceProfile.refined;
    String profileName = 'refined';
    int progressEvery = 10;
    int workers = math.max(1, Platform.numberOfProcessors - 4);

    for (final String arg in args) {
      if (arg.startsWith('--dataset=')) {
        datasetPath = arg.substring('--dataset='.length);
      } else if (arg.startsWith('--trials=')) {
        trials = int.parse(arg.substring('--trials='.length));
      } else if (arg.startsWith('--seed=')) {
        seed = int.parse(arg.substring('--seed='.length));
      } else if (arg.startsWith('--keep-best=')) {
        keepBest = int.parse(arg.substring('--keep-best='.length));
      } else if (arg.startsWith('--train-split=')) {
        trainSplit = arg.substring('--train-split='.length);
      } else if (arg.startsWith('--validation-split=')) {
        validationSplit = arg.substring('--validation-split='.length);
      } else if (arg.startsWith('--holdout-split=')) {
        holdoutSplit = arg.substring('--holdout-split='.length);
      } else if (arg.startsWith('--max-train-entries=')) {
        maxTrainEntries = int.parse(
          arg.substring('--max-train-entries='.length),
        );
      } else if (arg == '--profile=wide') {
        searchSpace = SearchSpaceProfile.wide;
        profileName = 'wide';
      } else if (arg == '--profile=plausible') {
        searchSpace = SearchSpaceProfile.plausible;
        profileName = 'plausible';
      } else if (arg == '--profile=refined') {
        searchSpace = SearchSpaceProfile.refined;
        profileName = 'refined';
      } else if (arg == '--profile=special-heavy') {
        searchSpace = SearchSpaceProfile.specialHeavy;
        profileName = 'special-heavy';
      } else if (arg.startsWith('--progress-every=')) {
        progressEvery = int.parse(arg.substring('--progress-every='.length));
      } else if (arg.startsWith('--workers=')) {
        workers = int.parse(arg.substring('--workers='.length));
      } else {
        throw ArgumentError('Unsupported argument "$arg".');
      }
    }

    return _CliOptions(
      datasetFile: File(datasetPath),
      trials: trials,
      seed: seed,
      keepBest: keepBest,
      trainSplit: trainSplit,
      validationSplit: validationSplit,
      holdoutSplit: holdoutSplit,
      maxTrainEntries: maxTrainEntries,
      searchSpace: searchSpace,
      profileName: profileName,
      progressEvery: progressEvery,
      workers: workers,
    );
  }

  final File datasetFile;
  final int trials;
  final int seed;
  final int keepBest;
  final String trainSplit;
  final String validationSplit;
  final String holdoutSplit;
  final int? maxTrainEntries;
  final SearchSpaceProfile searchSpace;
  final String profileName;
  final int progressEvery;
  final int workers;
}

class _SearchResult {
  const _SearchResult({
    required this.weights,
    required this.train,
    required this.validation,
    required this.holdout,
  });

  final SearchWeights weights;
  final EvaluationSummary train;
  final EvaluationSummary validation;
  final EvaluationSummary holdout;
}

class _WorkerSpec {
  const _WorkerSpec({required this.workerId, required this.trials});

  final int workerId;
  final int trials;
}

class _WorkerRequest {
  const _WorkerRequest({
    required this.sendPort,
    required this.workerId,
    required this.trials,
    required this.keepBest,
    required this.seed,
    required this.searchSpace,
    required this.trainEntries,
    required this.validationEntries,
    required this.holdoutEntries,
    required this.progressEvery,
  });

  final SendPort sendPort;
  final int workerId;
  final int trials;
  final int keepBest;
  final int seed;
  final SearchSpaceProfile searchSpace;
  final List<PreparedDatasetEntry> trainEntries;
  final List<PreparedDatasetEntry> validationEntries;
  final List<PreparedDatasetEntry> holdoutEntries;
  final int progressEvery;
}

_SearchResult _evaluateWeights(
  SearchWeights weights,
  List<PreparedDatasetEntry> trainEntries,
  List<PreparedDatasetEntry> validationEntries,
  List<PreparedDatasetEntry> holdoutEntries,
) {
  final PreparedSearchWeightEvaluator evaluator = PreparedSearchWeightEvaluator(
    searchWeights: weights,
  );
  return _SearchResult(
    weights: weights,
    train: evaluator.evaluateAll(trainEntries),
    validation: evaluator.evaluateAll(validationEntries),
    holdout: evaluator.evaluateAll(holdoutEntries),
  );
}

void _insertBestResult(
  List<_SearchResult> bestResults,
  _SearchResult candidate,
  int keepBest,
) {
  int insertIndex = bestResults.length;
  for (int index = 0; index < bestResults.length; index++) {
    if (_compareResults(candidate, bestResults[index]) < 0) {
      insertIndex = index;
      break;
    }
  }

  bestResults.insert(insertIndex, candidate);
  if (bestResults.length > keepBest) {
    bestResults.removeLast();
  }
}

int _compareResults(_SearchResult left, _SearchResult right) {
  final List<int> comparisons = <int>[
    right.validation.optimizationScore.compareTo(
      left.validation.optimizationScore,
    ),
    right.holdout.optimizationScore.compareTo(left.holdout.optimizationScore),
    right.validation.averageRecallAtK.compareTo(
      left.validation.averageRecallAtK,
    ),
    left.validation.averageBestWinGap.compareTo(
      right.validation.averageBestWinGap,
    ),
    right.train.optimizationScore.compareTo(left.train.optimizationScore),
  ];

  for (final int comparison in comparisons) {
    if (comparison != 0) {
      return comparison;
    }
  }
  return 0;
}

List<_WorkerSpec> _buildWorkerSpecs(int trials, int workers) {
  final int boundedWorkers = math.max(1, math.min(trials, workers));
  final int baseTrials = trials ~/ boundedWorkers;
  final int remainder = trials % boundedWorkers;

  return <_WorkerSpec>[
    for (int workerId = 0; workerId < boundedWorkers; workerId++)
      _WorkerSpec(
        workerId: workerId,
        trials: baseTrials + (workerId < remainder ? 1 : 0),
      ),
  ];
}

void _workerMain(_WorkerRequest request) {
  final math.Random random = math.Random(request.seed);
  final List<_SearchResult> bestResults = <_SearchResult>[];

  for (int trial = 0; trial < request.trials; trial++) {
    final SearchWeights candidate = request.searchSpace.sample(random);
    final _SearchResult result = _evaluateWeights(
      candidate,
      request.trainEntries,
      request.validationEntries,
      request.holdoutEntries,
    );
    _insertBestResult(bestResults, result, request.keepBest);

    final int completed = trial + 1;
    if (completed == request.trials || completed % request.progressEvery == 0) {
      request.sendPort.send(<Object?, Object?>{
        'type': 'progress',
        'workerId': request.workerId,
        'completed': completed,
      });
    }
  }

  request.sendPort.send(<Object?, Object?>{
    'type': 'result',
    'results': <Map<String, Object>>[
      for (final _SearchResult result in bestResults)
        _serializeSearchResult(result),
    ],
  });
}

Map<String, Object> _serializeSearchResult(_SearchResult result) {
  return <String, Object>{
    'weights': <String, double>{
      'genericLeader': result.weights.genericLeader,
      'regularUnit': result.weights.regularUnit,
      'eliteUnit': result.weights.eliteUnit,
      'specialEliteUnit': result.weights.specialEliteUnit,
      'surpriseAttack': result.weights.surpriseAttack,
      'settlementLevel': result.weights.settlementLevel,
    },
    'train': _serializeSummary(result.train),
    'validation': _serializeSummary(result.validation),
    'holdout': _serializeSummary(result.holdout),
  };
}

Map<String, Object> _serializeSummary(EvaluationSummary summary) {
  return <String, Object>{
    'averageRecallAtK': summary.averageRecallAtK,
    'averageTop3Overlap': summary.averageTop3Overlap,
    'averageBestWinGap': summary.averageBestWinGap,
    'fullTop3Matches': summary.fullTop3Matches,
    'entryCount': summary.entryCount,
  };
}

_SearchResult _parseSearchResult(Map<Object?, Object?> json) {
  final Map<Object?, Object?> weights =
      json['weights']! as Map<Object?, Object?>;
  return _SearchResult(
    weights: SearchWeights(
      genericLeader: weights['genericLeader']! as double,
      regularUnit: weights['regularUnit']! as double,
      eliteUnit: weights['eliteUnit']! as double,
      specialEliteUnit: weights['specialEliteUnit']! as double,
      surpriseAttack: weights['surpriseAttack']! as double,
      settlementLevel: weights['settlementLevel']! as double,
    ),
    train: _parseSummary(json['train']! as Map<Object?, Object?>),
    validation: _parseSummary(json['validation']! as Map<Object?, Object?>),
    holdout: _parseSummary(json['holdout']! as Map<Object?, Object?>),
  );
}

EvaluationSummary _parseSummary(Map<Object?, Object?> json) {
  return EvaluationSummary(
    averageRecallAtK: json['averageRecallAtK']! as double,
    averageTop3Overlap: json['averageTop3Overlap']! as double,
    averageBestWinGap: json['averageBestWinGap']! as double,
    fullTop3Matches: json['fullTop3Matches']! as int,
    entryCount: json['entryCount']! as int,
  );
}

void _printProgress({
  required String phase,
  required int completed,
  required int total,
  required String label,
  required Stopwatch stopwatch,
  required int every,
  bool force = false,
}) {
  if (!force && completed != total && completed % every != 0) {
    return;
  }

  final Duration elapsed = stopwatch.elapsed;
  final double rate = completed / math.max(1, elapsed.inMilliseconds);
  final int remainingMillis = rate == 0
      ? 0
      : ((total - completed) / rate).round();
  final Duration remaining = Duration(milliseconds: remainingMillis);
  final double percent = (completed / total) * 100;

  stdout.writeln(
    '[${phase.toUpperCase()}] '
    '$completed/$total '
    '(${percent.toStringAsFixed(1)}%) '
    'elapsed=${_formatDuration(elapsed)} '
    'eta=${_formatDuration(remaining)} '
    '$label',
  );
}

String _formatDuration(Duration duration) {
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);
  return '${hours.toString().padLeft(2, '0')}:'
      '${minutes.toString().padLeft(2, '0')}:'
      '${seconds.toString().padLeft(2, '0')}';
}
