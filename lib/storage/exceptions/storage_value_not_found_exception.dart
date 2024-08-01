class StorageValueNotFoundException implements Exception {
  final String key;

  StorageValueNotFoundException(this.key);

  @override
  String toString() => 'The value from the key: $key,' r'''don't exists''';
}
