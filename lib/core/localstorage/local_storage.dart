enum LocalStorageResult {
  saved,
  deleted,
  failed,
}

abstract class LocalStorage {
  Future<void> init();
  Future<LocalStorageResult> saveString(String key, String value);
  Future<LocalStorageResult> saveInt(String key, int value);
  Future<LocalStorageResult> saveBool(String key, bool value);
  Future<String?> getString(String key);
  Future<int?> getInt(String key);
  Future<bool> getBool(String key);
  Future<LocalStorageResult> removeData(String key);

  /// keys
  static const String onboarding = "on_boarding";
  static const String userData = "user_data";
  static const String marketingAdsLastShown = "marketing_ads_last_shown";
}
