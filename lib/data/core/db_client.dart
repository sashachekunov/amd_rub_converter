import 'package:amd_rub_converter/data/core/exceptions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DBClient {
  final SharedPreferences _preferences;

  const DBClient(this._preferences);

  dynamic read(String key) => _makeRequest(() => _read(key));

  void write(String key, Object value) =>
      _makeRequest(() => _write(key, value));

  dynamic _read(String key) {
    final response = _preferences.getString(key);

    if (response == null) {
      throw DataBaseException(
        'Persistent storage doesn\'t contain '
        'a value for a given key: $key',
      );
    }

    return _decodeFromJsonString(response);
  }

  void _write(String key, Object value) async {
    final response =
        await _preferences.setString(key, _encodeToJsonString(value));

    if (!response) throw const DataBaseException();
  }

  String _encodeToJsonString(Object value) {
    if (value is String) return value.toString();

    try {
      return json.encode(value);
    } catch (e) {
      return value.toString();
    }
  }

  dynamic _decodeFromJsonString(String jsonString) {
    try {
      return json.decode(jsonString);
    } catch (e) {
      return jsonString;
    }
  }

  T _makeRequest<T>(T Function() request) {
    try {
      return request();
    } on DataBaseException {
      rethrow;
    } catch (e) {
      throw DataBaseException(e.toString());
    }
  }
}
