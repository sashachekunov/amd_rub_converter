import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/data_sources/country_local_data_source.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

void testReadCountries(SharedPreferences preferences) async {
  final dataSource = CountryLocalDataSourceImpl(DBClient(preferences));

  try {
    expect(await dataSource.readCountries(), DBConstants.countries);
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testCreateCountries(SharedPreferences preferences) async {
  final dataSource = CountryLocalDataSourceImpl(DBClient(preferences));

  try {
    await dataSource.createCountries();
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}
