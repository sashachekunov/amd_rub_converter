import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/use_cases/read_currencies.dart';
import 'package:amd_rub_converter/domain/use_cases/create_currencies.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testCreateCurrencies(CurrencyRepository repository) async {
  final createCurrencies = CreateCurrencies(repository);

  final voidOrFailure = await createCurrencies(const NoParams());

  voidOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (result) => result,
  );
}

void testReadCurrencies(CurrencyRepository repository) async {
  final readCurrencies = ReadCurrencies(repository);

  final currenciesOrFailure = await readCurrencies(const NoParams());

  currenciesOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (currencies) => expect(currencies, [
      StubEntities.armenianDram,
      StubEntities.unitedStatesDollar,
    ]),
  );
}
