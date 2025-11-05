import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'exceptions/storage_value_not_found_exception.dart';
import 'package:meta/meta.dart';

abstract class StorageContract<T> {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(resetOnError: true),
    iOptions: IOSOptions(
      synchronizable: false,
      accessibility: KeychainAccessibility.unlocked_this_device,
    ),
  );

  FlutterSecureStorage get storage => _storage;

  final String key;

  StorageContract(this.key);

  /// Get value
  Future<T> get value;

  /// Update raw value
  Future<void> update(T value);

  /// Delete raw value
  Future<void> clear() async => await storage.delete(
    key: key,
    iOptions: IOSOptions(
      synchronizable: false,
      accessibility: KeychainAccessibility.unlocked_this_device,
    ),
  );

  @protected
  Future<String?> read() => storage.read(key: key);

  /// Check if value exists after generate
  Future<bool> get existStrict async {
    try {
      return await value != null;
    } catch (_) {
      return false;
    }
  }

  @protected
  Future<String> readForce() async {
    String? value = await storage.read(key: key);

    if (value == null) {
      throw StorageValueNotFoundException(key);
    }

    return value;
  }

  @protected
  Future<void> write(String? value) async {
    if (value != null) {
      await storage.write(key: key, value: value);
    } else {
      await clear();
    }
  }

  /// Check if key is wrote
  Future<bool> exists() async => await read() != null;
}
