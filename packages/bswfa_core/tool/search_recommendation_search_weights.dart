import 'dart:io';
import 'dart:math' as math;

import 'recommendation_search_weight_tools.dart';

void main(List<String> args) {
  final _CliOptions options = _CliOptions.parse(args);
  final List<DatasetEntry> allEntries = loadDatasetEntries(options.datasetFile);
  final List<PreparedDatasetEntry> preparedEntries = prepareDatasetEntries(
    allEntries,
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

  if (trainEntries.isEmpty) {
    throw StateError('No train entries matched split "${options.trainSplit}".');
  }
  if (validationEntries.isEmpty) {
    throw StateError(
      'No validation entries matched split "${options.validationSplit}".',
    );
  }

  final math.Random random = math.Random(options.seed);
  final List<_SearchResult> bestResults = <_SearchResult>[];

  final SearchWeights baselineWeights = const SearchWeights(
    genericLeader: 0.331,
    regularUnit: 1.0,
    eliteUnit: 1.330,
    specialEliteUnit: 2.053,
    surpriseAttack: 0.216,
    settlementLevel: 2.399,
  );
  final _SearchResult baselineResult = _evaluateWeights(
    baselineWeights,
    trainEntries,
    validationEntries,
  );
  _insertBestResult(bestResults, baselineResult, options.keepBest);

  for (int trial = 0; trial < options.trials; trial++) {
    final SearchWeights candidate = options.searchSpace.sample(random);
    final _SearchResult result = _evaluateWeights(
      candidate,
      trainEntries,
      validationEntries,
    );
    _insertBestResult(bestResults, result, options.keepBest);

    if ((trial + 1) % 10 == 0) {
      stdout.writeln(
        'Trial ${trial + 1}/${options.trials} best validation score: '
        '${bestResults.first.validation.optimizationScore.toStringAsFixed(4)}',
      );
    }
  }

  stdout.writeln('');
  stdout.writeln('Top ${bestResults.length} weight sets:');
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
  }
}

class _CliOptions {
  const _CliOptions({
    required this.datasetFile,
    required this.trials,
    required this.seed,
    required this.keepBest,
    required this.trainSplit,
    required this.validationSplit,
    required this.maxTrainEntries,
    required this.searchSpace,
  });

  factory _CliOptions.parse(List<String> args) {
    String datasetPath = 'tool/recommendation_weight_dataset.json';
    int trials = 60;
    int seed = 42;
    int keepBest = 5;
    String trainSplit = 'train';
    String validationSplit = 'validation';
    int? maxTrainEntries;
    SearchSpaceProfile searchSpace = SearchSpaceProfile.refined;

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
      } else if (arg.startsWith('--max-train-entries=')) {
        maxTrainEntries = int.parse(
          arg.substring('--max-train-entries='.length),
        );
      } else if (arg == '--profile=plausible') {
        searchSpace = SearchSpaceProfile.plausible;
      } else if (arg == '--profile=wide') {
        searchSpace = SearchSpaceProfile.wide;
      } else if (arg == '--profile=refined') {
        searchSpace = SearchSpaceProfile.refined;
      } else if (arg == '--profile=special-heavy') {
        searchSpace = SearchSpaceProfile.specialHeavy;
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
      maxTrainEntries: maxTrainEntries,
      searchSpace: searchSpace,
    );
  }

  final File datasetFile;
  final int trials;
  final int seed;
  final int keepBest;
  final String trainSplit;
  final String validationSplit;
  final int? maxTrainEntries;
  final SearchSpaceProfile searchSpace;
}

class _SearchResult {
  const _SearchResult({
    required this.weights,
    required this.train,
    required this.validation,
  });

  final SearchWeights weights;
  final EvaluationSummary train;
  final EvaluationSummary validation;
}

_SearchResult _evaluateWeights(
  SearchWeights weights,
  List<PreparedDatasetEntry> trainEntries,
  List<PreparedDatasetEntry> validationEntries,
) {
  final PreparedSearchWeightEvaluator evaluator = PreparedSearchWeightEvaluator(
    searchWeights: weights,
  );
  return _SearchResult(
    weights: weights,
    train: evaluator.evaluateAll(trainEntries),
    validation: evaluator.evaluateAll(validationEntries),
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
