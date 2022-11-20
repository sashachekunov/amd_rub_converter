import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/use_cases/read_countries.dart';
import 'package:amd_rub_converter/domain/use_cases/create_countries.dart';
import 'package:amd_rub_converter/domain/repositories/country_repository.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testCreateCountries(CountryRepository repository) async {
  final createCountries = CreateCountries(repository);

  final voidOrFailure = await createCountries(const NoParams());

  voidOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (result) => result,
  );
}

void testReadCountries(CountryRepository repository) async {
  final readCountries = ReadCountries(repository);

  final countriesOrFailure = await readCountries(const NoParams());

  countriesOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (countries) => expect(countries, [StubEntities.armenia, StubEntities.usa]),
  );
}
