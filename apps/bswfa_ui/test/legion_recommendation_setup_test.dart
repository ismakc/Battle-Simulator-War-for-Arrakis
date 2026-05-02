import 'package:bswfa_ui/presentation/widgets/battle_simulator/legion_recommendation_setup.dart';
import 'package:bswfa_ui/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('recommendation setup exposes own availability controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: LegionRecommendationSetup())),
    );

    expect(_fieldset('Own Availability'), findsOneWidget);
    expect(_unitInput('Leader max', 2), findsOneWidget);
    expect(_unitInput('Regular max', 6), findsOneWidget);
    expect(_unitInput('Elite max', 6), findsOneWidget);
    expect(_unitInput('Special max', 6), findsOneWidget);
  });

  testWidgets('own leader availability can be changed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: LegionRecommendationSetup())),
    );

    final UnitInput leaderInput = tester.widget<UnitInput>(
      _unitInput('Leader max', 2),
    );
    leaderInput.onValueChanged(1);
    await tester.pump();

    expect(_unitInput('Leader max', 1), findsOneWidget);
  });
}

Finder _unitInput(String label, int value) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is UnitInput &&
        widget.label == label &&
        widget.startPosition == value,
  );
}

Finder _fieldset(String label) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is LabeledBorderFieldset && widget.label == label,
  );
}
