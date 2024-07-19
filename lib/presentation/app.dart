import 'package:bswfa/bloc/battle_history_bloc.dart';
import 'package:bswfa/bloc/battle_scenario_bloc.dart';
import 'package:bswfa/bloc/collapse_cubit.dart';
import 'package:bswfa/bloc/full_battle_simulation_bloc.dart';
import 'package:bswfa/presentation/widgets/main/main_screen.dart';
import 'package:bswfa/presentation/widgets/main/main_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollapseCubit>(
          create: (BuildContext context) => CollapseCubit(),
        ),
        BlocProvider<BattleScenarioBloc>(
          create: (BuildContext context) => BattleScenarioBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => BattleHistoryBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => FullBattleSimulationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        themeMode: ThemeMode.light,
        title: 'WfA Battle Simulator',
        home: const ContentFrame(
          child: Scaffold(
            appBar: MainTopBar(),
            body: MainScreen(),
          ),
        ),
      ),
    );
  }
}

class ContentFrame extends StatelessWidget {
  const ContentFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
