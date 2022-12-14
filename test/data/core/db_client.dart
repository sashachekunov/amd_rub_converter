import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'dart:convert';

void testRead(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    final response = await client.read('string_key');

    expect(response, 'string');
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testWrite(SharedPreferences preferences) async {
  final client = createDBClient(preferences);

  try {
    client.write('string_key', 'string');
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

DBClient createDBClient(SharedPreferences preferences) => DBClient(preferences);

Future<SharedPreferences> createMockedSharedPreferences() async {
  SharedPreferences.setMockInitialValues(
    {
      'bool_key': true,
      'string_key': 'string',
      DBConstants.firstLaunchKey: '',
      DBConstants.countriesKey:
          json.encode(DBConstants.countries.map((e) => e.toJson()).toList()),
      DBConstants.currenciesKey:
          json.encode(DBConstants.currencies.map((e) => e.toJson()).toList()),
      DBConstants.organizationsKey: json
          .encode(DBConstants.organizations.map((e) => e.toJson()).toList()),
      DBConstants.cashExchangeRateAMDRUBKey:
          json.encode(DBConstants.exchangeRateAMDRUB.toJson()),
    },
  );

  return await SharedPreferences.getInstance();
}

Future<SharedPreferences> createMockedSharedPreferencesWithExceptions() async {
  SharedPreferences.setMockInitialValues(
    {
      'string_key': true,
      'bool_key': 'string',
      DBConstants.firstLaunchKey: 0,
      DBConstants.countriesKey: 0,
      DBConstants.currenciesKey: 0,
      DBConstants.organizationsKey: 0,
      DBConstants.cashExchangeRateAMDRUBKey: 0,
    },
  );

  return await SharedPreferences.getInstance();
}
