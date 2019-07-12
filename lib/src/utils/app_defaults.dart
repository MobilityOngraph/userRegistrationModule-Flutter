import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper<T> {
  static final String SHARED_PREFS_NAME = "idaelzPref";
  static SharedPreferences sharedPreferences;

  // ignore: non_constant_identifier_names
  static SharedPrefHelper INSTANCE;

  static Future<SharedPrefHelper> getInstance()  async {
    if (INSTANCE == null) {
      INSTANCE = new SharedPrefHelper();
    }
    sharedPreferences = await SharedPreferences.getInstance();
    return INSTANCE;
  }

  SharedPrefHelper() {
    INSTANCE = this;
  }

  // ignore: missing_return
  Future<T> save(String key, T value) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value) as T;
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value) as T;
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value) as T;
    } else if (value is String) {
      return await sharedPreferences.setString(key, value) as T;
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value) as T;
    }
  }

  Future<T> get(String key) async {
    return await sharedPreferences.get(key) as Future<T>;
  }

  Future<T> getWithDefault(String key, T defValue) async {
    Future<T> returnValue = sharedPreferences.get(key);
    return returnValue == null ? defValue : await sharedPreferences.get(key);
  }


}
