abstract class BattleNodeStateCache<K, V> {
  V? operator [](K key);

  void operator []=(K key, V value);
}

/// Cache en memoria respaldada por un [Map].
class InMemoryBattleNodeStateCache<K, V> implements BattleNodeStateCache<K, V> {
  final Map<K, V> _cache = <K, V>{};

  @override
  V? operator [](K key) => _cache[key];

  @override
  void operator []=(K key, V value) {
    _cache[key] = value;
  }
}

/// Implementación de cache que nunca almacena valores.
class NonCachingBattleNodeStateCache<K, V>
    implements BattleNodeStateCache<K, V> {
  @override
  V? operator [](K key) => null;

  @override
  void operator []=(K key, V value) {}
}
