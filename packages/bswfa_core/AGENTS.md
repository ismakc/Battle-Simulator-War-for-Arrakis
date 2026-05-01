# AGENTS.md

This file defines working rules for agents editing `packages/bswfa_core`.

## Scope

`bswfa_core` is the battle simulation and recommendation engine for the project.

Main areas:

- `lib/battle/`: hit calculation, round resolution, exact probability distribution, automatic battle flow.
- `lib/legion/`: legion model, losses, recommendation engine.
- `lib/roll/`: combat dice and roll encoding.
- `test/`: behavioral and contract tests for the core engine.

## Working Model

Treat this package as domain logic, not UI support code.

Priorities:

- Keep battle rules explicit and reviewable.
- Prefer deterministic, testable logic over convenience shortcuts.
- Separate literal game rules from app heuristics.
- Preserve current public APIs unless the change explicitly requires an API change.

## Domain Rules

When changing combat logic, assume these distinctions matter:

- A single combat round and a multi-round automatic battle are different layers.
- `surpriseAttack` only applies to the first round.
- `usedCards` are currently excluded from recommendation flows unless the task says otherwise.
- Named leaders and generic leaders are not interchangeable.
- Defender settlement value affects battle context and dice, but is not the same thing as legion cost.
- Automatic battle policies may be heuristics; if a rule is heuristic, document it clearly in code.

## Recommendation Engine

Files under `lib/legion/recommendation/` are performance-sensitive.

Current behavior to preserve unless the task changes it:

- Return at most 3 recommendations by default.
- Recommendation ranking is probability-first, then loss risk, then heuristic cost.
- Candidate preselection is intentionally limited by `maxEvaluatedCandidates`.
- Candidate preselection starts near the enemy battle value, including settlement value when relevant.
- UI callers should run recommendation resolution off the main isolate, but the core should still avoid unnecessary
  combinatorial blowups.

When editing the recommender:

- Avoid evaluating all possible candidates unless there is a strong reason.
- Prefer pruning, caching, and ordering improvements before adding more exhaustive search.
- Keep displayed legion cost separate from contextual battle value.

## Probability Engine

Files under `lib/battle/distribution/` are also performance-sensitive.

Current design intent:

- Use exact grouped dice-count outcomes, not naive enumeration of every die sequence.
- Cache reusable intermediate results when safe.
- Keep probability mass conserved.

If you change the distribution engine:

- Verify that probabilities still sum to 1 within test tolerance.
- Prefer grouping by equivalent outcomes over expanding the state tree blindly.

## Generated Files

This package uses `freezed`.

Rules:

- If you edit a source file with a `part '*.freezed.dart';`, regenerate the corresponding generated file.
- Do not hand-edit `*.freezed.dart` files.
- If a task does not require changing a freezed model, avoid touching generated files.

## Validation

Before finishing a core change, run:

```powershell
dart analyze
dart test
```

If the change is tightly scoped and the full suite is too expensive, run at least the directly affected tests and state
that explicitly.

## Git

This package may live in a dirty worktree.

Rules:

- Never revert unrelated changes.
- Read `git status --short` before committing.
- Commit only the files you changed.
- If unrelated files are already staged, use a path-specific commit so you do not absorb someone else's work.

## Editing Style

- Keep code ASCII unless the file already requires otherwise.
- Prefer small, explicit methods over opaque compact logic in rule-heavy code.
- Add short comments only where the rule or heuristic is non-obvious.
- Preserve current naming unless the task clearly benefits from a rename.

## Testing Expectations

Prefer adding or updating targeted tests for:

- combat rule changes,
- probability aggregation changes,
- loss-resolution changes,
- recommendation ranking or validation changes.

Good existing test anchors:

- `battle_rules_test.dart`
- `battle_distribution_test.dart`
- `legion_contract_test.dart`
- `legion_recommendation_test.dart`
- `legion_recommendation_validation_test.dart`

