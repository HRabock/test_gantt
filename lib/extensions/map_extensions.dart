extension MapContainsAndNotNull on Map {
  bool containsKeyAndNotNull(String key) {
    return containsKey(key) && this[key] != null;
  }
}

extension TryGetKey<K, V> on Map<K, V?> {
  String tryGetKey(K key) {
    return (containsKey(key) && this[key] != null) ? this[key].toString() : "";
  }
}
