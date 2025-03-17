import 'package:get_storage/get_storage.dart';

class LocalStorage {
  late final GetStorage _storage;

  // Singleton instance
  static final LocalStorage instance = LocalStorage._internal();

  LocalStorage._internal();

  // Initialize storage with a bucket name
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    instance._storage = GetStorage(bucketName);
  }

  // Save data
  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // Read data
  dynamic readData(String key) {
    return _storage.read(key);
  }

  // Remove a specific key
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all stored data
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
