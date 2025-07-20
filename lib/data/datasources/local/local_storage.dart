import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';

/// Interface para armazenamento local
abstract class LocalStorage {
  Future<bool> setString(String key, String value);
  Future<String?> getString(String key);
  Future<bool> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<bool> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<bool> remove(String key);
  Future<bool> clear();

  // Métodos específicos para o app
  Future<bool> saveTheme(ThemeMode theme);
  Future<ThemeMode> getTheme();
  Future<bool> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<bool> removeAuthToken();
  Future<bool> saveUserData(String userData);
  Future<String?> getUserData();
  Future<bool> removeUserData();
}

/// Implementação do armazenamento local usando SharedPreferences
class LocalStorageImpl implements LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorageImpl(this.sharedPreferences);

  @override
  Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return sharedPreferences.getBool(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await sharedPreferences.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return sharedPreferences.getInt(key);
  }

  @override
  Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }

  @override
  Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

  // Métodos específicos para o app
  @override
  Future<bool> saveTheme(ThemeMode theme) async {
    String themeString;
    switch (theme) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
        themeString = 'system';
        break;
    }
    return await setString(AppConstants.themeKey, themeString);
  }

  @override
  Future<ThemeMode> getTheme() async {
    final themeString = await getString(AppConstants.themeKey);
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<bool> saveAuthToken(String token) async {
    return await setString(AppConstants.userTokenKey, token);
  }

  @override
  Future<String?> getAuthToken() async {
    return await getString(AppConstants.userTokenKey);
  }

  @override
  Future<bool> removeAuthToken() async {
    return await remove(AppConstants.userTokenKey);
  }

  @override
  Future<bool> saveUserData(String userData) async {
    return await setString(AppConstants.userDataKey, userData);
  }

  @override
  Future<String?> getUserData() async {
    return await getString(AppConstants.userDataKey);
  }

  @override
  Future<bool> removeUserData() async {
    return await remove(AppConstants.userDataKey);
  }
}
