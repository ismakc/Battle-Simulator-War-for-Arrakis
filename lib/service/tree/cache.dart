Cache<K, V> _newCacheInstance<K, V>() {
  return MemoizationCache<K, V>();
}

abstract class Cache<K, V> {
  factory Cache.create() => _newCacheInstance<K, V>();

  V? get(K key);

  V put(K key, V value);

  bool containsKey(K key);
}

class MemoizationCache<K, V> implements Cache<K, V> {
  final Map<K, V> _cache = <K, V>{};

  @override
  V? get(K key) {
    return _cache[key];
  }

  @override
  V put(K key, V value) {
    _cache[key] = value;
    return value;
  }

  @override
  bool containsKey(K key) {
    return _cache.containsKey(key);
  }
}

class NopCache<K, V> implements Cache<K, V> {
  @override
  V? get(K key) {
    return null;
  }

  @override
  V put(K key, V value) {
    return value;
  }

  @override
  bool containsKey(K key) {
    return false;
  }
}
