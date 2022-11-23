import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/data_sources/currency_local_data_source.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

void testReadCurrencies(SharedPreferences preferences) async {
  final dataSource = CurrencyLocalDataSourceImpl(DBClient(preferences));

  try {
    expect(await dataSource.readCurrencies(), DBConstants.currencies);
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testCreateCurrencies(SharedPreferences preferences) async {
  final dataSource = CurrencyLocalDataSourceImpl(DBClient(preferences));

  try {
    await dataSource.createCurrencies();
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}
