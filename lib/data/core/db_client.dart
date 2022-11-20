import 'package:amd_rub_converter/data/core/exceptions.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DBClient {
  final SharedPreferences _preferences;

  const DBClient(this._preferences);

  Future<bool> readBool(String key) => _makeRequest(
        () async => _handleReadResponse(_preferences.getBool(key)),
      );

  Future<String> readString(String key) => _makeRequest(
        () async => _handleReadResponse(_preferences.getString(key)),
      );

  Future<bool> writeBool(String key, bool value) async => _makeRequest(
        () async =>
            _handleWriteResponse(await _preferences.setBool(key, value)),
      );

  Future<bool> writeString(String key, String value) async => _makeRequest(
        () async =>
            _handleWriteResponse(await _preferences.setString(key, value)),
      );

  T _handleReadResponse<T>(T? response) {
    if (response == null) throw const DataBaseException();

    return response;
  }

  bool _handleWriteResponse(bool response) {
    if (!response) throw const DataBaseException();

    return response;
  }

  Future<T> _makeRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } catch (e) {
      throw const DataBaseException();
    }
  }
}
