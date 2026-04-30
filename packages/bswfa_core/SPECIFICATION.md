# bswfa_core Specification

This document is a handoff-oriented specification for `packages/bswfa_core`.
It describes the current architecture, implemented behavior, intentional heuristics,
performance constraints, and known next steps so another AI or engineer can continue
work without reconstructing context from chat history.

## Purpose

`bswfa_core` is the rules and simulation engine for battles in *Dune: War for Arrakis*.

Current responsibilities:
- Represent attacker and defender legions.
- Compute hits for a single combat round.
- Compute exact round hit statistics and exact multi-round probability distributions.
- Resolve an automatic battle flow with app-specific heuristics.
- Recommend own-legion configurations against a known enemy legion.

It is a pure domain package. UI concerns should stay outside this package.

## Package Layout

Top-level modules:
- `lib/battle/`
- `lib/legion/`
- `lib/roll/`
- `test/`

Important subareas:
- `lib/battle/distribution/`
  Exact grouped probability engine for multi-round simulations.
- `lib/battle/simulation/`
  Automatic battle resolution heuristics used by the app.
- `lib/legion/recommendation/`
  Recommender that searches candidate legions and ranks them.

## Core Domain Model

### Legion

Main model:
- [legion.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/legion.dart)

Two variants:
- `AttackingLegion`
- `DefendingLegion`

Shared fields:
- `genericLeaders`
- `regularUnits`
- `eliteUnits`
- `specialEliteUnits`
- `namedLeaders`
- `usedCards`

Attacker-only field:
- `surpriseAttack`

Defender-only field:
- `settlementLevel`

Derived values used throughout the engine:
- `totalUnits`
- `totalLeaders`
- `remainingLossCapacity`
- `diceCount`
- `maxStarsCount`
- `removedShieldsCount`

### Dice

Main files:
- [battle_die.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/roll/battle_die.dart)
- [dice_roll.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/roll/dice_roll.dart)
- [battle_dice_roll.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/roll/battle_dice_roll.dart)

Combat die faces:
- 3 swords
- 2 shields
- 1 star

`DiceRoll` uses a compact bitmask encoding for swords, shields, and stars.

## Implemented Rule Interpretation

### Single Round Hit Calculation

Main file:
- [battle_hits_calculator.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/battle_hits_calculator.dart)

Current behavior:
- Attacker and defender roll up to 6 combat dice.
- Defender gets extra dice from settlement level.
- Surprise attack adds 1 star only for the first round.
- Special elite units remove opponent shields before hits are finalized.

Leader activation policy:
- The engine no longer uses a fixed leader ordering.
- It enumerates valid leader activation profiles for the rolled stars.
- It selects outcomes with a min-max style heuristic:
  - attacker side prefers higher inflicted hits, then lower suffered hits;
  - defender side answers with the same logic.

Important note:
- `leader_activation_order_policy.dart` still exists, but the current hit calculator no longer depends on it for actual round resolution.

### Casualty Resolution

Main files:
- [automatic_battle_loss_application_policy.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/simulation/automatic_battle_loss_application_policy.dart)
- [legion_optimal_loss_policy.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/legion_optimal_loss_policy.dart)

Current rules and heuristics:
- Losses are applied one hit at a time.
- Elite and special elite units downgrade to regulars when appropriate.
- If all units are gone, surviving leaders are also removed.

Important distinction:
- Some loss logic is a heuristic for automatic simulation, not a literal player-choice resolver.

### Automatic Battle

Main files:
- [automatic_battle_resolver.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/simulation/automatic_battle_resolver.dart)
- [automatic_battle_round_resolver.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/simulation/automatic_battle_round_resolver.dart)
- [automatic_battle_end_policy.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/simulation/automatic_battle_end_policy.dart)

Current assumptions:
- Automatic resolution means the attacker keeps fighting while the battle can continue.
- The defender does not retreat.
- `surpriseAttack` is cleared after round 1.
- `usedCards` are reset to zero after round 1.
- If the defender is in a settlement, the attacker pays the extra hit only if the battle can continue.

Important limitation:
- The automatic multi-round resolver is still heuristic because it applies rounded expected hits rather than propagating full state distributions.

## Exact Probability Engine

### Round Distribution

Main file:
- [battle_round_distribution_resolver.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/distribution/battle_round_distribution_resolver.dart)

Design:
- Does not enumerate every raw die sequence.
- Groups outcomes by `(swords, shields, stars)` counts.
- Computes multinomial weights for grouped outcomes.
- Applies battle results and aggregates equivalent post-round scenarios.

Performance design:
- Caches grouped dice outcomes per dice count.
- Caches resolved round outcomes per `BattleScenario`.

### Multi-Round Distribution

Main file:
- [battle_distribution_resolver.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/distribution/battle_distribution_resolver.dart)

Design:
- Propagates a `Map<BattleScenario, probability>` over rounds.
- Aggregates attacker win, defender win, draw, and unresolved probability.
- Uses `AutomaticBattleRoundPolicy` for cross-round cleanup (`surpriseAttack`, `usedCards`).

Main return type:
- [battle_distribution.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/battle/distribution/battle_distribution.dart)

## Recommendation Engine

### Goal

Given an enemy legion and user constraints, return up to 3 recommended own-legion configurations.

Main files:
- [legion_recommendation_request.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/recommendation/legion_recommendation_request.dart)
- [legion_recommendation_constraints.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/recommendation/legion_recommendation_constraints.dart)
- [legion_recommendation_resolver.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/recommendation/legion_recommendation_resolver.dart)
- [legion_recommendation.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/recommendation/legion_recommendation.dart)

### Recommendation Scope (Current)

Included:
- regular units
- elite units
- special elite units
- generic leaders
- settlement level context for defenders
- surprise attack flag for attackers

Explicitly excluded for now:
- `usedCards`
- `NamedLeader`
- retreat logic

### Recommendation Request

Current request fields:
- `enemyLegion`
- `ownRole`
- `constraints`
- `maxRounds`
- `targetWinProbability`
- `limit`
- `maxEvaluatedCandidates`

`maxEvaluatedCandidates` exists to bound the search cost. Default is `250`.

### Ranking Logic

Final recommendation sorting uses:
1. Higher own win probability.
2. Lower own loss probability.
3. Lower legion cost.
4. Fewer total units + leaders.
5. Higher resolved probability.

If no candidate reaches `targetWinProbability`, the resolver still returns the best candidates found.

### Cost Heuristic

Main file:
- [legion_recommendation_cost_policy.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/lib/legion/recommendation/legion_recommendation_cost_policy.dart)

Displayed legion cost:
- `surpriseAttack = 0.25`
- `genericLeader = 0.50`
- `regular = 1.00`
- `elite = 1.75`
- `specialElite = 2.75`

Contextual battle value:
- same as legion cost, plus
- `settlementLevel * 1.00` for defenders only

Important distinction:
- `calculate(...)` is legion cost.
- `calculateBattleValue(...)` is contextual search value.
- Settlement is not part of displayed legion cost.

### Candidate Search Strategy

Current implementation is not exhaustive in practice.

Flow:
1. Generate all legal candidates within constraints.
2. Pre-sort candidates before expensive simulation.
3. Prefer candidates whose contextual battle value is closest to the enemy battle value.
4. Break ties using estimated candidate strength and lower cost.
5. Evaluate only the first `maxEvaluatedCandidates`.
6. Simulate those candidates with `BattleDistributionResolver`.
7. Rank and return at most 3.

This was added specifically to reduce UI lock-ups caused by evaluating too many candidates.

## UI Integration Expectations

The UI should not reimplement battle logic.

Expected usage:
- Build `LegionRecommendationRequest`.
- Call `LegionRecommendationResolver().resolve(...)`.
- Render `LegionRecommendation` results.

Important performance note:
- The UI should run recommendation resolution off the main Flutter isolate.
- Even with the current optimizations, recommendation search can still be expensive for large constraints.
- `maxEvaluatedCandidates` should usually be passed explicitly from the UI, likely around `100` to `150` for responsiveness.

## Freezed Usage

This package uses `freezed` for several models.

Rules:
- Never hand-edit `*.freezed.dart`.
- If you change a freezed source model, regenerate code.
- Do not regenerate unrelated generated files just because they exist.

## Test Coverage

Current important tests:
- [battle_rules_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/battle_rules_test.dart)
- [battle_distribution_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/battle_distribution_test.dart)
- [legion_recommendation_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/legion_recommendation_test.dart)
- [legion_recommendation_validation_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/legion_recommendation_validation_test.dart)
- [legion_contract_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/legion_contract_test.dart)
- [battle_statistic_calculator_test.dart](/C:/Users/ismae/dvl/bswfa/packages/bswfa_core/test/battle_statistic_calculator_test.dart)

Validation command:

```powershell
dart analyze
dart test
```

## Known Tradeoffs And Open Work

### 1. Automatic Battle Resolver Is Still Heuristic

The exact distribution engine exists, but the older automatic battle resolver still uses rounded expected hits.

If future work needs fully exact automatic outcomes, that resolver should be rebuilt on top of the distribution engine instead of expected-hit rounding.

### 2. Recommendation Search Is Bounded, Not Optimal

The recommender deliberately stops after `maxEvaluatedCandidates`.

Implication:
- It is faster.
- It is not guaranteed to find the mathematically best candidate across the full legal search space.

This is an intentional tradeoff.

### 3. Named Leaders And Used Cards Are Out Of Scope

The current recommender ignores them completely.

If they are added later:
- update candidate generation,
- update cost and battle-value heuristics,
- update tests,
- re-check performance.

### 4. UI Must Use Background Execution

Core optimizations reduce cost but do not eliminate the need for background execution in Flutter.

### 5. Legacy Files May No Longer Reflect Final Logic

Example:
- `leader_activation_order_policy.dart` remains in the tree even though leader activation now happens by outcome enumeration and heuristic selection in the hit calculator.

Do not assume every file in the package is still a primary decision point.

## Suggested Next Steps

If another AI continues work, likely next tasks are:
- integrate recommender safely in UI using isolates,
- tune `maxEvaluatedCandidates` from real UI usage,
- decide whether recommendation search should expose a "fast" versus "exact" mode,
- add support for `NamedLeader` and/or `usedCards`,
- decide whether automatic battle should migrate fully to distribution-based resolution,
- remove or refactor now-secondary code paths if they are no longer used.

## Relevant Recent Commits

Recent core work was split into small commits:
- `77c3ac7` Add probabilistic battle distribution resolver
- `4a91300` Add legion recommendation resolver
- `5b55bec` Optimize legion recommendations
- `af27b8f` Prioritize recommendations by enemy battle value
- `e0e4506` Add bswfa_core agent guide

Use those commits to inspect implementation intent if needed.

