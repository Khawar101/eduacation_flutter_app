import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<bool> save(String key, String json) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json);
  }

  static Future<String> retrieve(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<bool> saveBool(String key, bool json) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, json);
  }
  static Future<bool> retrieveBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? true;
  }

  static Future<bool> removeValueAgainstKey(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
