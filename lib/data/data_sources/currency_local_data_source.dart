import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/models/currency_model.dart';

abstract class CurrencyLocalDataSource {
  const CurrencyLocalDataSource();

  Future<void> createCurrencies();
  Future<List<CurrencyModel>> readCurrencies();
}

class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final DBClient _client;

  const CurrencyLocalDataSourceImpl(this._client);

  @override
  Future<void> createCurrencies() async {
    final currencies = DBConstants.currencies.map((e) => e.toJson()).toList();

    _client.write(DBConstants.currenciesKey, currencies);
  }

  @override
  Future<List<CurrencyModel>> readCurrencies() async {
    final response = await _client.read(DBConstants.currenciesKey);

    try {
      return (response as Iterable)
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
    } catch (e) {
      throw const ResponseException();
    }
  }
}
