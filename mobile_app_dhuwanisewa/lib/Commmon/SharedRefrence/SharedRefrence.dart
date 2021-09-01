import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedReference {
  Future<bool> setInt(String key, int value);
  Future<int> getInt(String key);
  Future<bool> setString(String key, String value);
  Future<String> getString(String key);
  Future<bool> setJsonData(Map<String,dynamic> jsonData, String key);
  Future<dynamic> getJsonData(String key);
}

class SharedReferenceImplementation extends SharedReference {

  Future<SharedPreferences> get preferences async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setInt(String key, int value) async {
    final _pref = await preferences;
    bool succedded = false;
    succedded = await _pref.setInt(key, value);
    return succedded;
  }

  @override
  Future<int> getInt(String key) async {
    int result = 0;
    final _pref = await preferences;
    result = _pref.getInt(key) ?? 0;
    return result;
  }

  @override
  Future<bool> setString(String key, String value) async {
    bool succedded = false;
    final _pref = await preferences;
    succedded = await _pref.setString(key, value);
    return succedded;
  }

  @override
  Future<String> getString(String key) async {
    final _pref = await preferences;
    String result = _pref.getString(key) ?? '';
    return result;
  }

  @override
  Future<bool> setJsonData(Map<String,dynamic> jsonData, String key) async {
    final _pref = await preferences;
    if (jsonData.isNotEmpty) {
      String encodedData = json.encode(jsonData);
      return _pref.setString(key, encodedData);
    }
    return false;
  }

  @override
  Future<Map<String,dynamic>> getJsonData(String key) async {
    final _pref = await preferences;
    String result = _pref.getString(key) ?? '';
    if (result.isNotEmpty) return json.decode(result);
    return new Map<String,dynamic>();
  }
}
