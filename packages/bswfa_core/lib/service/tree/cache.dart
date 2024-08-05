Cache<K, V> _createNewCacheInstance<K, V>() {
  return MemoizationCache<K, V>();
}

sealed class Cache<K, V> {
  factory Cache.create() => _createNewCacheInstance<K, V>();

  V? get(K key);

  void put(K key, V? value);

  bool hasKey(K key);
}

class MemoizationCache<K, V> implements Cache<K, V> {
  final Map<K, V?> _cache = <K, V?>{};

  @override
  V? get(K key) {
    return _cache[key];
  }

  @override
  void put(K key, V? value) {
    _cache[key] = value;
  }

  @override
  bool hasKey(K key) {
    return _cache.containsKey(key);
  }
}

class NopCache<K, V> implements Cache<K, V> {
  @override
  V? get(K key) {
    return null;
  }

  @override
  void put(K key, V? value) {}

  @override
  bool hasKey(K key) {
    return false;
  }
}
