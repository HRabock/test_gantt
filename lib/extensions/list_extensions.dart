extension FirstWhereExtension<T> on List<T> {
  T? firstWhereNullable(bool test(T element)) {
    for (var el in this) {
      if (test(el)) return el;
    }
    return null;
  }
}
