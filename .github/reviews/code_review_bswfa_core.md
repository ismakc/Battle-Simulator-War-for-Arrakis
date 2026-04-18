# 🔍 Revisión de Código — `bswfa_core`

Revisión exhaustiva del paquete `packages/bswfa_core` (17 archivos fuente, ~800 líneas).

---

## 🔴 Bugs / Errores de Corrección

### 1. La desviación estándar nunca aplica `sqrt()` — **`battle_statistic_calculator.dart:47-58, 67-78`**

Los métodos `calcAttackerStdDevHits` y `calcDefenderStdDevHits` calculan correctamente la **varianza** (E[X²] − E[X]²), pero la guardan en un campo llamado `StdDeviationHits` sin aplicar la raíz cuadrada. Esto significa que lo que el usuario ve como "desviación estándar" es en realidad la **varianza**.

```dart
// Actual (calcula varianza, no desviación estándar):
final double result = (squaredAttackerHits +
        occurrences * (attackerExpectedHits * attackerExpectedHits) -
        2 * attackerExpectedHits * attackerHits) /
    occurrences;
return double.parse(result.toStringAsFixed(2));

// Correcto:
return double.parse(math.sqrt(result).toStringAsFixed(2));
```

**Impacto:** Los valores de desviación estándar mostrados al usuario son incorrectos (son el cuadrado de lo que deberían ser).

---

### 2. `orderDefenderLeaders` es idéntica a `orderAttackerLeaders` — **`leader_selector_policy.dart:12-18`**

Ambas funciones priorizan líderes por **ataque** descendente. Sin embargo, para el defensor, la prioridad debería ser **defensa** descendente, ya que las estrellas del defensor se usan para generar escudos más que espadas.

```dart
// Actual (ambas idénticas, priorizando ataque):
static List<NamedLeader> orderDefenderLeaders(List<NamedLeader> namedLeaders) {
  return List<NamedLeader>.from(namedLeaders)
    ..sort((a, b) => b.attack != a.attack
        ? b.attack.compareTo(a.attack)
        : b.defense.compareTo(a.defense));
}

// Sugerido (defensor prioriza defensa):
static List<NamedLeader> orderDefenderLeaders(List<NamedLeader> namedLeaders) {
  return List<NamedLeader>.from(namedLeaders)
    ..sort((a, b) => b.defense != a.defense
        ? b.defense.compareTo(a.defense)
        : b.attack.compareTo(a.attack));
}
```

**Impacto:** La simulación no optimiza correctamente la selección de líderes del defensor, subvalorando su capacidad defensiva.

---

### 3. `BattleStatistic.add()` suma desviaciones estándar linealmente — **`battle_statistic.dart:23-30`**

El método `add()` suma `attackerStdDeviationHits` directamente. Esto es matemáticamente incorrecto: las **varianzas** se suman (si las rondas son independientes), no las desviaciones estándar. Debería sumar varianzas y luego aplicar `sqrt()` al total.

```dart
// Actual:
attackerStdDeviationHits: attackerStdDeviationHits + val.attackerStdDeviationHits,

// Si se corrige el bug #1 (usar varianza interna), se debería sumar varianzas y luego sqrt:
// Var(X+Y) = Var(X) + Var(Y)  → σ(X+Y) = √(Var(X) + Var(Y))
```

**Nota:** Actualmente `add()` no se usa en `bswfa_core` (la simulación multi-ronda descarta la stddev con `0.0`), pero si se empezara a usar, el resultado sería incorrecto.

---

### 4. `BattleResult` factory privada nombrada `_BattleStatistic` — **`battle_result.dart:17`**

```dart
}) = _BattleStatistic;  // ← Confunde con la clase real BattleStatistic
```

Debería ser `_BattleResult` para coincidir con la convención de freezed.

---

## 🟡 Mejoras de Diseño y Mantenibilidad

### 5. Masiva duplicación entre `AttackingLegion`, `DefendingLegion` y `Legion`

Las tres clases repiten ~40 líneas de lógica idéntica: `diceCount`, `lifeCount`, `totalUnits`, `totalLeaders`, más los campos comunes. `Legion` actúa como un adaptador mutable que copia datos de/hacia las otras dos.

**Sugerencia:** Extraer un mixin o interfaz compartida:
```dart
mixin LegionStats {
  int get genericLeaders;
  int get regularUnits;
  int get eliteUnits;
  int get specialEliteUnits;
  List<NamedLeader> get namedLeaders;

  int get lifeCount => regularUnits + eliteUnits * 2 + specialEliteUnits * 2 
                       + genericLeaders + namedLeaders.length;
  int get totalUnits => regularUnits + eliteUnits + specialEliteUnits;
  int get totalLeaders => genericLeaders + namedLeaders.length;
}
```

---

### 6. `BattleResult.winner()` compara `lifeCount` en lugar de resultado esperado

```dart
String winner() {
  if (attackingLegion.lifeCount > defendingLegion.lifeCount) {
    return 'Attacker';
  }
```

Esto compara la vida **actual de la legión** (unidades × puntos de vida), no los hits esperados del combate. ¿Es intencional? Si el objetivo es determinar el ganador de la batalla simulada, debería comparar los hits esperados contra la vida del oponente, o usar el escenario post-combate.

---

### 7. `Node.defaultNodeInitialCapacity` nunca se usa — **`node.dart:4`**

```dart
static const int defaultNodeInitialCapacity = 6;  // Declarado pero nunca usado
final List<Node<T>> children;  // Se crea sin capacity hint
```

Eliminar la constante muerta o usarla como `List<Node<T>>.filled(0, ..., growable: true)` con reserva.

---

### 8. `clamp(0, double.infinity).toInt()` — **`battle_hits_calculator.dart:89-90`**

```dart
final int usefulShields = (opponentShields - specialEliteUnits).clamp(0, double.infinity).toInt();
return (totalSwords - usefulShields).clamp(0, double.infinity).toInt();
```

`clamp(0, double.infinity)` fuerza una conversión innecesaria a `num`/`double`. Más idiomático y eficiente:
```dart
final int usefulShields = math.max(0, opponentShields - specialEliteUnits);
return math.max(0, totalSwords - usefulShields);
```

---

### 9. Valores mágicos hardcodeados en `battle_simulator.dart`

- **Línea 37:** `rounds == 2` → debería ser una constante con nombre como `_roundsBeforeCardReset`.
- **Línea 77-78:** `attackerStdDeviationHits: 0.0` → la desviación estándar de la simulación multi-ronda se descarta silenciosamente. Añadir un `// TODO` o documentar esta limitación.
- **Línea 96:** `expectedHits.round()` → el uso de `round()` puede causar imprecisiones (e.g., 2.5 → 3 hits, pero 2.4 → 2 hits). Considerar si `floor()` o `ceil()` es más apropiado según la semántica del juego.

---

### 10. Sin protección contra bucle infinito en `simulateMultipleRounds` — **`battle_simulator.dart:31`**

Si un escenario tiene 0 dados pero unidades > 0 (p. ej., solo líderes sin unidades combatientes), el bucle `while (!combatEnds)` nunca termina porque:
- `expectedHits = 0` → no se aplica daño → `totalUnits` nunca llega a 0
- `totalAttackerExpectedHits` nunca supera la vida

**Sugerencia:** Añadir un límite máximo de rondas:
```dart
const int maxRounds = 20;
while (!combatEnds && rounds < maxRounds) {
```

---

### 11. `BattleStats` es mutable sin encapsulación — **`battle_hits_calculator.dart:50-91`**

`BattleStats` tiene campos públicos mutables (`swordHits`, `starHits`, etc.) y los métodos `accumulate*` simplemente asignan valores. Esto rompe el principio de inmutabilidad del resto del proyecto.

**Sugerencia:** Hacer los campos finales y construir el objeto de una sola vez, o al menos hacerlos privados con getters.

---

### 12. `memoization()` hace doble lookup — **`battle_tree_processor.dart:35-41`**

```dart
BattleNodeState? memoization(BattleNodeState state) {
  if (memo.containsKey(state.battleDiceRoll.fullDiceRollBitMask())) {
    return memo.get(state.battleDiceRoll.fullDiceRollBitMask());
  }
  return null;
}
```

`containsKey` + `get` es un doble acceso al mapa. Se puede simplificar:
```dart
BattleNodeState? memoization(BattleNodeState state) {
  return memo.get(state.battleDiceRoll.fullDiceRollBitMask());
}
```

Ya que `get` retorna `null` si no existe la clave.

---

### 13. `DiceRoll`, `BattleDiceRoll`, `BattleNodeState` no implementan `==`/`hashCode`

Estas clases son value objects pero no sobrecargan `==`/`hashCode`. Aunque el caché usa `int` como clave (por lo que funciona), dificulta la depuración y pruebas unitarias futuras.

---

## 🟠 Infraestructura y Calidad

### 14. Sin `analysis_options.yaml` en `bswfa_core`

Las reglas de lint (`always_specify_types`, `require_trailing_commas`, etc.) solo están configuradas en `bswfa_ui`. El paquete core no tiene archivo `analysis_options.yaml`, lo que significa que al desarrollar o analizar `bswfa_core` en aislamiento, no se aplican las reglas del proyecto.

**Sugerencia:** Crear `packages/bswfa_core/analysis_options.yaml` con las mismas reglas relevantes (excluyendo las específicas de Flutter como `sized_box_for_whitespace`).

---

### 15. Directorio `test/` completamente vacío

No hay ni un solo test unitario. Dado que el core contiene toda la lógica de simulación (matemáticas, bitmasks, árboles de permutación, pérdida óptima), la falta de tests es un riesgo alto.

**Tests prioritarios sugeridos:**
1. `BattleStatisticCalculator` — validar fórmulas de media y varianza/stddev
2. `BattleHitsCalculator` — verificar cálculo de hits para combinaciones conocidas
3. `DiceRoll` — validar codificación/decodificación bitmask
4. `Legion.calculateOptimalLoss` — validar estrategia óptima de pérdida
5. `LeaderSelectorPolicy` — verificar ordenamiento correcto

---

### 16. Singletons dificultan testing

`BattleHitsCalculator` y `BattleSimulator` usan constructores privados + singleton estático. Esto impide inyectar mocks para pruebas unitarias aisladas.

**Sugerencia:** Mantener la convención singleton pero añadir:
```dart
@visibleForTesting
static void resetInstance() { _instance = BattleHitsCalculator._(); }
```

O bien, pasar las dependencias como parámetros en los métodos (que `BattleStatisticCalculator` ya hace parcialmente).

---

### 17. `toStringAsFixed(2)` + `double.parse()` para redondeo — **`battle_statistic_calculator.dart:44,58,64,78`**

```dart
return double.parse(result.toStringAsFixed(2));
```

Convertir a string y volver a parsear es ineficiente y poco idiomático. Alternativa:
```dart
return (result * 100).roundToDouble() / 100;
```

---

## 📊 Resumen

| Severidad | Count | Descripción |
|-----------|-------|-------------|
| 🔴 Bug | 4 | sqrt faltante, política defensor duplicada, nombre factory incorrecto, suma stddev |
| 🟡 Diseño | 8 | Duplicación legiones, valor mágico, clamp innecesario, mutabilidad, doble lookup, etc. |
| 🟠 Infra | 4 | Sin tests, sin analysis_options, singletons no-testeables, redondeo por string |

**Prioridad de acción recomendada:**
1. **🔴 Corregir `sqrt()`** en `calcAttackerStdDevHits`/`calcDefenderStdDevHits`
2. **🔴 Corregir `orderDefenderLeaders`** para priorizar defensa
3. **🔴 Renombrar `_BattleStatistic` → `_BattleResult`**
4. **🟠 Crear `analysis_options.yaml`** para el paquete core
5. **🟡 Añadir protección de bucle infinito** en `simulateMultipleRounds`
6. **🟠 Escribir tests unitarios** para la lógica crítica
