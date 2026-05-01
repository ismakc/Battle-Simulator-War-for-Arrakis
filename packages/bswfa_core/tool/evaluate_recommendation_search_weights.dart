import 'dart:io';

import 'recommendation_search_weight_tools.dart';

void main(List<String> args) {
  final _CliOptions options = _CliOptions.parse(args);
  final List<DatasetEntry> entries = loadDatasetEntries(options.datasetFile)
      .where(
        (DatasetEntry entry) =>
            options.split == null || entry.split == options.split,
      )
      .take(options.maxEntries ?? 1 << 30)
      .toList(growable: false);

  if (entries.isEmpty) {
    throw StateError('No dataset entries matched the requested filters.');
  }

  final List<PreparedDatasetEntry> preparedEntries = prepareDatasetEntries(
    entries,
  );
  final PreparedSearchWeightEvaluator evaluator = PreparedSearchWeightEvaluator(
    searchWeights: options.searchWeights,
  );
  final EvaluationSummary summary = evaluator.evaluateAll(preparedEntries);

  stdout.writeln('Evaluated ${summary.entryCount} entries');
  stdout.writeln('Search weights: ${options.searchWeights}');
  stdout.writeln(
    'Average recall within preselection budget: '
    '${summary.averageRecallAtK.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'Average top-3 overlap: ${summary.averageTop3Overlap.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'Average best-win gap: ${summary.averageBestWinGap.toStringAsFixed(4)}',
  );
  stdout.writeln(
    'Entries with full top-3 match: ${summary.fullTop3Matches}/${summary.entryCount}',
  );
  stdout.writeln(
    'Optimization score: ${summary.optimizationScore.toStringAsFixed(4)}',
  );
}

class _CliOptions {
  const _CliOptions({
    required this.datasetFile,
    required this.searchWeights,
    required this.split,
    required this.maxEntries,
  });

  factory _CliOptions.parse(List<String> args) {
    String datasetPath = 'tool/recommendation_weight_dataset.json';
    String? split;
    int? maxEntries;
    double genericLeader = 0.331;
    double regularUnit = 1.0;
    double eliteUnit = 1.330;
    double specialEliteUnit = 2.053;
    double surpriseAttack = 0.216;
    double settlementLevel = 2.399;

    for (final String arg in args) {
      if (arg.startsWith('--dataset=')) {
        datasetPath = arg.substring('--dataset='.length);
      } else if (arg.startsWith('--split=')) {
        split = arg.substring('--split='.length);
      } else if (arg.startsWith('--max-entries=')) {
        maxEntries = int.parse(arg.substring('--max-entries='.length));
      } else if (arg.startsWith('--generic-leader=')) {
        genericLeader = double.parse(arg.substring('--generic-leader='.length));
      } else if (arg.startsWith('--regular=')) {
        regularUnit = double.parse(arg.substring('--regular='.length));
      } else if (arg.startsWith('--elite=')) {
        eliteUnit = double.parse(arg.substring('--elite='.length));
      } else if (arg.startsWith('--special=')) {
        specialEliteUnit = double.parse(arg.substring('--special='.length));
      } else if (arg.startsWith('--surprise=')) {
        surpriseAttack = double.parse(arg.substring('--surprise='.length));
      } else if (arg.startsWith('--settlement=')) {
        settlementLevel = double.parse(arg.substring('--settlement='.length));
      } else {
        throw ArgumentError('Unsupported argument "$arg".');
      }
    }

    return _CliOptions(
      datasetFile: File(datasetPath),
      split: split,
      maxEntries: maxEntries,
      searchWeights: SearchWeights(
        genericLeader: genericLeader,
        regularUnit: regularUnit,
        eliteUnit: eliteUnit,
        specialEliteUnit: specialEliteUnit,
        surpriseAttack: surpriseAttack,
        settlementLevel: settlementLevel,
      ),
    );
  }

  final File datasetFile;
  final SearchWeights searchWeights;
  final String? split;
  final int? maxEntries;
}
