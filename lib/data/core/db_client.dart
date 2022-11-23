import 'package:amd_rub_converter/data/core/exceptions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DBClient {
  final SharedPreferences _preferences;

  const DBClient(this._preferences);

  Future<dynamic> read(String key) => _makeRequest(
        () async {
          final response = _preferences.getString(key);

          if (response == null) {
            throw DataBaseException(
              'Persistent storage doesn\'t contain '
              'a value for a given key: $key',
            );
          }

          return _decodeJsonString(response);
        },
      );

  Future<void> write(String key, Object value) async => _makeRequest(
        () async {
          final response =
              await _preferences.setString(key, _encodeJsonString(value));

          if (!response) throw const DataBaseException();
        },
      );

  String _encodeJsonString(Object value) {
    try {
      return json.encode(value);
    } catch (e) {
      return value.toString();
    }
  }

  dynamic _decodeJsonString(String jsonString) {
    try {
      return json.decode(jsonString);
    } catch (e) {
      return jsonString;
    }
  }

  Future<T> _makeRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DataBaseException {
      rethrow;
    } catch (e) {
      throw DataBaseException(e.toString());
    }
  }
}
