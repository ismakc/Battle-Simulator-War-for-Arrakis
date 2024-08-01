import 'dart:ui';

import 'package:bswfa/bloc/collapse_cubit.dart';
import 'package:bswfa/presentation/widgets/battle_simulator/battle_history.dart';
import 'package:bswfa/presentation/widgets/battle_simulator/battle_scenario_setup.dart';
import 'package:bswfa/presentation/widgets/battle_simulator/battle_simulator_button.dart';
import 'package:bswfa/presentation/widgets/common/collapsed.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: MainScrollView(
        child: Wrap(
          runSpacing: 8.0,
          children: <Widget>[
            Collapsable(
              visible: isCollapsed(context),
              child: FittedBox(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: const Wrap(
                    runSpacing: 8.0,
                    children: <Widget>[
                      BattleScenarioSetup(),
                      BattleSimulatorButton(),
                    ],
                  ),
                ),
              ),
            ),
            const BattleHistory(),
          ],
        ),
      ),
    );
  }
}

class MainScrollView extends StatelessWidget {
  const MainScrollView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: <PointerDeviceKind>{
          ...ScrollConfiguration.of(context).dragDevices,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: child,
      ),
    );
  }
}
