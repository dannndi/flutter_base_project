import 'package:base_project/core/localstorage/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageSecure extends LocalStorage {
  FlutterSecureStorage? storage;

  @override
  Future<void> init() async {
    final androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    storage = FlutterSecureStorage(aOptions: androidOptions);
  }

  @override
  Future<LocalStorageResult> saveBool(String key, bool value) async {
    if (storage == null) await init();

    try {
      await storage?.write(key: key, value: value ? "1" : "0");
      return LocalStorageResult.saved;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }

  @override
  Future<LocalStorageResult> saveInt(String key, int value) async {
    if (storage == null) await init();

    try {
      await storage?.write(key: key, value: value.toString());
      return LocalStorageResult.saved;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }

  @override
  Future<LocalStorageResult> saveString(String key, String value) async {
    if (storage == null) await init();

    try {
      await storage?.write(key: key, value: value);
      return LocalStorageResult.saved;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }

  @override
  Future<bool> getBool(String key) async {
    if (storage == null) await init();

    try {
      final result = await storage?.read(key: key);
      return result == "1";
    } catch (e) {
      return false;
    }
  }

  @override
  Future<int?> getInt(String key) async {
    if (storage == null) await init();

    try {
      final result = await storage?.read(key: key);
      return result == null ? null : int.tryParse(result);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getString(String key) async {
    if (storage == null) await init();

    try {
      return storage?.read(key: key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LocalStorageResult> removeData(String key) async {
    if (storage == null) await init();

    try {
      await storage?.delete(key: key);
      return LocalStorageResult.deleted;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }
}
