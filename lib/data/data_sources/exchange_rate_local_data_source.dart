import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/mappers/exchange_rate_mapper.dart';
import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';

abstract class ExchangeRateLocalDataSource {
  const ExchangeRateLocalDataSource();

  Future<bool> isExchangeRateValid(int timestamp);
  Future<double> convertCurrency(double amount, ExchangeRateModel exchangeRate);
  Future<ExchangeRateModel> readExchangeRateAMDRUB(bool cashless);
  Future<void> updateExchangeRateAMDRUB({
    required bool cashless,
    required double rate,
    required int timestamp,
    required List<OrganizationModel> organizations,
  });
}

class ExchangeRateLocalDataSourceImpl implements ExchangeRateLocalDataSource {
  final DBClient _client;

  const ExchangeRateLocalDataSourceImpl(this._client);

  @override
  Future<double> convertCurrency(
          double amount, ExchangeRateModel exchangeRate) async =>
      ExchangeRateMapper.fromModel(exchangeRate).convert(amount);

  @override
  Future<bool> isExchangeRateValid(int timestamp) async {
    // TODO: update timestamp validation
    return DateTime.now()
            .difference(DateTime.fromMillisecondsSinceEpoch(timestamp))
            .inHours >=
        2;
  }

  @override
  Future<ExchangeRateModel> readExchangeRateAMDRUB(bool cashless) async {
    final response = await _client.read(
      cashless
          ? DBConstants.cashlessExchangeRateAMDRUBKey
          : DBConstants.cashExchangeRateAMDRUBKey,
    );

    try {
      return ExchangeRateModel.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw const ResponseException();
    }
  }

  @override
  Future<void> updateExchangeRateAMDRUB({
    required bool cashless,
    required double rate,
    required int timestamp,
    required List<OrganizationModel> organizations,
  }) async {
    await _client.write(
      cashless
          ? DBConstants.cashlessExchangeRateAMDRUBKey
          : DBConstants.cashExchangeRateAMDRUBKey,
      DBConstants.exchangeRateAMDRUB.copyWith(
        rate: rate,
        timestamp: timestamp,
        organizations: organizations,
      ),
    );
  }
}
