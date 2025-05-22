extension PipenListExtension on List {
  List<T> cloneRemove<T>(Object? value) {
    List<T> clone = [...this as List<T>];
    clone.remove(value);
    return clone;
  }
}
