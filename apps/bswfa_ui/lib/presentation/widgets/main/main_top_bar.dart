import 'package:bswfa_ui/bloc/battle_history_bloc.dart';
import 'package:bswfa_ui/bloc/battle_scenario_bloc.dart';
import 'package:bswfa_ui/bloc/collapse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MainTopBar extends StatelessWidget implements PreferredSizeWidget {
  const MainTopBar({super.key});

  Future<String> _getVersionNumber() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return 'v${packageInfo.version}+${packageInfo.buildNumber}';
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: AppBar(
          title: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 80.0),
                  child: const Text('Battle Simulator: War For Arrakis'),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: FutureBuilder<String>(
                  future: _getVersionNumber(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    final String versionText = snapshot.hasData ? '${snapshot.data} ' : '';
                    return Text(
                      versionText,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          actions: const <Widget>[
            ResetButton(),
            CollapseButton(),
          ],
          backgroundColor: Colors.black87,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            color: Colors.amber,
            height: 1.2,
          ),
          toolbarHeight: preferredSize.height,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        color: Colors.amber,
        icon: const Icon(Icons.refresh),
        onPressed: () {
          context.read<BattleHistoryBloc>().add(const BattleHistoryEvent.reset());
          context.read<BattleScenarioBloc>().add(const BattleScenarioEvent.reset());
        },
      ),
    );
  }
}

class CollapseButton extends StatelessWidget {
  const CollapseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24.0),
      child: IconButton(
        color: Colors.amber,
        icon: Builder(
          builder: (BuildContext context) {
            return Icon(
              context.watch<CollapseCubit>().state.collapsed ? Icons.expand_more : Icons.expand_less,
            );
          },
        ),
        onPressed: () => context.read<CollapseCubit>().toggle(),
      ),
    );
  }
}
