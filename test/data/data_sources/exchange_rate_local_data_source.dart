import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';
import 'package:amd_rub_converter/data/data_sources/exchange_rate_local_data_source.dart';

import '../../domain/core/stub_entities.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

void testConvertCurrency(SharedPreferences preferences) async {
  final dataSource = ExchangeRateLocalDataSourceImpl(DBClient(preferences));

  expect(
    await dataSource.convertCurrency(
      10000,
      ExchangeRateModel.fromEntity(StubEntities.dramToDollar),
    ),
    25,
  );
}

void testIsExchangeRateValid(SharedPreferences preferences) async {
  final dataSource = ExchangeRateLocalDataSourceImpl(DBClient(preferences));

  expect(await dataSource.isExchangeRateValid(100), false);
}

void testReadExchangeRateAMDRUB(SharedPreferences preferences) async {
  final dataSource = ExchangeRateLocalDataSourceImpl(DBClient(preferences));

  try {
    expect(
      await dataSource.readExchangeRateAMDRUB(false),
      DBConstants.exchangeRateAMDRUB,
    );
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testUpdateExchangeRateAMDRUB(SharedPreferences preferences) async {
  final dataSource = ExchangeRateLocalDataSourceImpl(DBClient(preferences));

  try {
    await dataSource.updateExchangeRateAMDRUB(
        cashless: true, rate: 10, timestamp: 20, organizations: const []);
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}
