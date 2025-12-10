extension InterleaveList<T> on List<T> {
  List<T> interleave(T interValue, {bool addToEnd = false}) {
    if (isEmpty) return [];

    final result = expand((item) => [item, interValue]).toList();

    if (!addToEnd && result.isNotEmpty) {
      result.removeLast();
    }

    return result;
  }
}
