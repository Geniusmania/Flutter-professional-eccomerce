import 'package:get_storage/get_storage.dart';

class LocalStorage {
  late final GetStorage _storage;
  static final LocalStorage instance = LocalStorage._internal();

  LocalStorage._internal();

  // Track whether storage has been initialized
  bool _isInitialized = false;

  // Initialize storage with a bucket name
  static Future<void> init(String bucketName) async {
    if (!instance._isInitialized) {
      await GetStorage.init(bucketName);
      instance._storage = GetStorage(bucketName);
      instance._isInitialized = true;
    }
  }

  void _ensureInitialized() {
    if (!_isInitialized) {
      throw Exception("LocalStorage not initialized. Call LocalStorage.init(bucketName) first.");
    }
  }

  // Save data
  Future<void> saveData(String key, dynamic value) async {
    _ensureInitialized();
    await _storage.write(key, value);
  }

  // Read data
  dynamic readData(String key) {
    _ensureInitialized();
    return _storage.read(key);
  }

  // Remove a specific key
  Future<void> removeData(String key) async {
    _ensureInitialized();
    await _storage.remove(key);
  }

  // Clear all stored data
  Future<void> clearAllData() async {
    _ensureInitialized();
    await _storage.erase();
  }
}
