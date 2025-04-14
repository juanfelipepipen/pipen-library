extension StringOutputExtension on String? {
  void output() {
    if (this != null) {
      print(this);
    }
  }
}
