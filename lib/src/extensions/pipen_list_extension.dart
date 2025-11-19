extension PipenListExtension on List {
  List<T> cloneRemove<T>(Object? value) {
    List<T> clone = [...this as List<T>];
    clone.remove(value);
    return clone;
  }

  List<T> intersperse<T>(T separator) {
    if (isEmpty) return [];

    final result = <T>[];
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}
