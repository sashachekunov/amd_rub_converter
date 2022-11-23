import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/models/country_model.dart';

abstract class CountryLocalDataSource {
  const CountryLocalDataSource();

  Future<void> createCountries();
  Future<List<CountryModel>> readCountries();
}

class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  final DBClient _client;

  const CountryLocalDataSourceImpl(this._client);

  @override
  Future<void> createCountries() async {
    final countries = DBConstants.countries.map((e) => e.toJson()).toList();

    await _client.write(DBConstants.countriesKey, countries);
  }

  @override
  Future<List<CountryModel>> readCountries() async {
    final response = await _client.read(DBConstants.countriesKey);

    try {
      return (response as Iterable)
          .map((e) => CountryModel.fromJson(e))
          .toList();
    } catch (e) {
      throw const ResponseException();
    }
  }
}
