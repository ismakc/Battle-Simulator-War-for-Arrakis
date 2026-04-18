# AGENTS.md

## Propósito Del Paquete

`bswfa_core` es la librería Dart pura que contiene el modelo de dominio y el motor de simulación de combate de *Battle Simulator: War For Arrakis*. No depende de Flutter y debe seguir siendo reutilizable desde cualquier cliente.

## Alcance

Este paquete es responsable de:

- modelar escenarios, resultados, legiones y tiradas,
- calcular impactos esperados y desviación usando permutación exhaustiva,
- resolver simulaciones de una ronda y de varias rondas,
- ofrecer una API estable para `apps/bswfa_ui`.

No debe introducir:

- dependencias de Flutter,
- lógica de presentación,
- estado de UI, blocs o widgets.

## Estructura Real Del Código

```text
lib/
  battle/
    battle_scenario.dart
    battle_result.dart
    battle_statistic.dart
    battle_hits_calculator.dart
    battle_side_contribution.dart
  legion/
    legion.dart
    legion_change.dart
    legion_limits.dart
    legion_optimal_loss.dart
    legion_resolution.dart
    named_leader.dart
  roll/
    battle_die.dart
    battle_dice_roll.dart
    dice_roll.dart
  service/
    battle_simulator.dart
    battle_statistic_calculator.dart
    tree/
      battle_tree_dice_permutator.dart
      battle_tree_processor.dart
      battle_node_state.dart
      battle_accumulated_hits.dart
      cache.dart
      node.dart
```

## Flujo De Simulación

La ruta principal es:

1. `BattleSimulator.simulateSingleRound(...)` o `simulateMultipleRounds(...)`.
2. `BattleStatisticCalculator.calc(...)` construye y procesa el árbol de permutaciones.
3. `BattleTreeDicePermutator` genera el árbol completo de resultados posibles.
4. `BattleTreeProcessor` evalúa nodos hoja con `BattleHitsCalculator` y reutiliza resultados con `Cache`.
5. `DiceRoll` representa conteos usando bitmasks compactos.
6. `BattleDiceRoll` combina tiradas de atacante y defensor para claves de memoización.

Si cambias reglas de combate, revisa siempre el impacto en:

- cálculo de impactos,
- codificación de tiradas,
- memoización,
- simulación multirronda.

## Convenciones Del Proyecto

- Usa imports de paquete: `package:bswfa_core/...`.
- Mantén tipos explícitos siempre que sea razonable; este repo evita inferencias innecesarias.
- Conserva trailing commas en constructores, colecciones y llamadas multilínea.
- Los servicios usan patrón singleton con constructor privado cuando ya existe ese diseño.
- Los modelos con `freezed` deben seguir siendo inmutables y coherentes con `copyWith`.
- No edites manualmente archivos generados `*.freezed.dart`.

## Freezed Y Código Generado

Tras modificar cualquier clase anotada con `@freezed`, regenera código desde la raíz del monorepo:

```bat
build_all.bat
```

Si solo necesitas validar este paquete:

```bat
dart run build_runner build --delete-conflicting-outputs
```

## Comandos Útiles

Desde `packages/bswfa_core`:

```bat
dart analyze
dart test
dart run build_runner build --delete-conflicting-outputs
```

Desde la raíz del repo:

```bat
build_all.bat
```

## Guía Para Cambios

Antes de tocar lógica de combate:

- identifica si el cambio afecta una sola ronda o la simulación completa,
- verifica si altera el bitmask de `DiceRoll` o la clave compuesta de cache,
- confirma si cambia la política de pérdidas óptimas de `Legion`.

Al añadir reglas nuevas:

- prioriza mantener la librería determinista y sin efectos secundarios,
- evita duplicar lógica entre `battle/`, `legion/` y `service/`,
- añade o actualiza tests en `test/` cuando exista cobertura relevante.

## Riesgos Comunes

- Cambiar `DiceRoll` o `BattleDiceRoll` puede invalidar memoización y resultados agregados.
- Cambiar `BattleHitsCalculator` puede alterar tanto expectativa como desviación.
- Cambiar `simulateMultipleRounds` puede modificar condiciones de fin de combate y reseteo de cartas.
- Renombrar o mover modelos `freezed` sin regenerar rompe compilación rápidamente.

## Expectativas Para Agentes

- Haz cambios mínimos y centrados en la regla o modelo afectado.
- Si una decisión impacta también a `bswfa_ui`, deja claro que el contrato del core cambió.
- Ejecuta al menos `dart analyze` y, si aplica, `dart test` antes de cerrar el trabajo.
- Si no puedes validar algo, indícalo explícitamente.
