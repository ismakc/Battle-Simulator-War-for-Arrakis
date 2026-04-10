# AGENTS.md

## Project Overview

**Battle Simulator: War For Arrakis (bswfa)** — A Dart/Flutter app (Android, Web, Windows) that simulates combat for the board game *Dune: War For Arrakis*, computing expected hits and standard deviation via exhaustive dice permutation trees.

## Architecture

Monorepo with two packages linked via path dependencies:

- **`packages/bswfa_core`** — Pure Dart library. Domain models + simulation engine. No Flutter dependency.
- **`apps/bswfa_ui`** — Flutter app. State management with `flutter_bloc`. Depends on `bswfa_core`.

### Core Simulation Pipeline (`bswfa_core`)

`BattleStatisticCalculator.calc(scenario)` is the entry point:
1. `BattleTreeDicePermutator` builds a tree of all dice permutations (each die has 6 faces: 3 sword, 2 shield, 1 star — see `Die.faces`).
2. `BattleTreeProcessor` evaluates leaf nodes via `BattleHitsCalculator` and aggregates results upward with memoization (`Cache` keyed by `DiceRoll.bitmask`).
3. `DiceRoll` uses **bitmask encoding** — sword/shield/star counts packed into 4-bit segments of an `int`. `BattleDiceRoll.fullDiceRollBitMask()` concatenates attacker+defender rolls for cache keys.
4. `BattleSimulator` orchestrates single-round (`simulateSingleRound`) and multi-round (`simulateMultipleRounds`) simulations. Multi-round resets cards/surprise after round 2 and applies optimal loss per round.

### UI Blocs (`bswfa_ui/lib/bloc/`)

Four blocs/cubits, all provided at root via `MultiBlocProvider` in `app.dart`:
- `BattleScenarioBloc` — holds current attacker/defender legion configuration
- `BattleHistoryBloc` — accumulates single-round simulation results
- `FullBattleSimulationBloc` — runs multi-round full battle simulation
- `CollapseCubit` — toggles UI section collapse state

## Code Generation (Freezed)

All domain models and bloc states/events use **`freezed`** for immutable classes with `copyWith`. Generated files: `*.freezed.dart`.

**Regenerate after modifying any `@freezed` class:**
```bat
build_all.bat        # one-shot build for both packages
build_all.bat -w     # watch mode
```
Order matters: `bswfa_core` is built first, then `bswfa_ui`. Each runs `dart run build_runner build --delete-conflicting-outputs`.

## Key Conventions

- **Always specify types** — enforced via `always_specify_types` lint rule. Use explicit types everywhere: `final List<BattleResult> x = <BattleResult>[];`, not `final x = [];`.
- **Trailing commas required** — `require_trailing_commas` is enabled. Every argument list and collection should end with a comma.
- **Package imports only** — `always_use_package_imports` is enforced. Use `package:bswfa_core/...` and `package:bswfa_ui/...`, never relative imports.
- **Singletons via private constructor** — Services like `BattleSimulator` and `BattleHitsCalculator` use `ClassName._()` + static `_instance`/`instance` pattern, not dependency injection.
- **`defaultValues` static const** — Domain models expose a `static const defaultValues` factory for initial/empty states (e.g., `BattleScenario.defaultValues`).
- **Bloc events use freezed union types** — e.g., `BattleScenarioEvent.updateAttackingLegion(...)`. Private generated classes (`_UpdateAttackingLegion`) are used in handlers.

## Build & Release

```bat
# Run the Flutter app (from apps/bswfa_ui/)
flutter run

# Build Android release (from project root, PowerShell)
.\release.ps1
# Prompts for version, builds bswfa_core, then flutter build appbundle

# Regenerate freezed code for all packages
build_all.bat
```

## Project Structure Reference

```
packages/bswfa_core/lib/
  domain/
    battle/    → BattleScenario, BattleResult, BattleStatistic
    legion/    → AttackingLegion, DefendingLegion, Legion, NamedLeader
    roll/      → Die (enum with faces), DiceRoll (bitmask), BattleDiceRoll
  service/
    battle_simulator.dart         → single/multi-round orchestration
    battle_statistic_calculator.dart → expected value + std deviation
    battle_hits_calculator.dart   → per-permutation hit resolution
    leader_selector_policy.dart   → leader activation ordering
    tree/      → permutation tree (Node, BattleTreeDicePermutator, Cache)

apps/bswfa_ui/lib/
  bloc/        → BLoCs and Cubits (freezed events/states)
  presentation/
    widgets/
      battle_simulator/ → simulation setup + history display
      legion_input/     → attacker/defender form inputs
      common/           → reusable UI components
      main/             → screen layout and top bar
```

