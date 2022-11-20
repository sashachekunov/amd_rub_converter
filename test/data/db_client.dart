import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test/test.dart';

void testReadBool(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    final response = await client.readBool('bool_key');

    expect(response, true);
  } catch (e) {
    expect(e, const DataBaseException());
  }
}

void testReadString(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    final response = await client.readString('string_key');

    expect(response, 'string');
  } catch (e) {
    expect(e, const DataBaseException());
  }
}

void testWriteBool(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    final response = await client.writeBool('bool_key', true);

    expect(response, true);
  } catch (e) {
    expect(e, const DataBaseException());
  }
}

void testWriteString(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    final response = await client.writeString('string_key', 'string');

    expect(response, true);
  } catch (e) {
    expect(e, const DataBaseException());
  }
}

DBClient createDBClient(SharedPreferences preferences) => DBClient(preferences);

Future<SharedPreferences> createMockedSharedPreferences() async {
  SharedPreferences.setMockInitialValues(
    {'bool_key': true, 'string_key': 'string'},
  );

  return await SharedPreferences.getInstance();
}

Future<SharedPreferences> createMockedSharedPreferencesWithExceptions() async {
  SharedPreferences.setMockInitialValues(
    {'string_key': true, 'bool_key': 'string'},
  );

  return await SharedPreferences.getInstance();
}
