// core/cache/cache_helper.dart

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._internal();
  factory CacheHelper() => _instance;
  CacheHelper._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    return _prefs!.getString(key);
  }

  Future<void> remove(String key) async {
    await _prefs!.remove(key);
  }

  Future<void> clear() async {
    await _prefs!.clear();
  }

String? getToken() {
  return _prefs?.getString('token'); // ← مش _prefs!
}

Future<void> saveToken(String token) async {
  await _prefs?.setString('token', token); // ← مش _prefs!
}

Future<void> deleteToken() async {
  await _prefs?.remove('token'); // ← مش _prefs!
}
}