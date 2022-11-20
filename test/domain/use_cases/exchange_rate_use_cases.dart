import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/use_cases/convert_currency.dart';
import 'package:amd_rub_converter/domain/use_cases/is_exchange_rate_valid.dart';
import 'package:amd_rub_converter/domain/use_cases/read_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/use_cases/update_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testIsExchangeRateValid(ExchangeRateRepository repository) async {
  final isExchangeRateValid = IsExchangeRateValid(repository);

  final validOrFailure = await isExchangeRateValid(0);

  validOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (valid) => expect(valid, false),
  );
}

void testConvertCurrency(ExchangeRateRepository repository) async {
  final convertCurrency = ConvertCurrency(repository);

  final valueOrFailure = await convertCurrency(
      const ConvertCurrencyParams(10000, StubEntities.dramToDollar));

  valueOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (value) => expect(value, 25),
  );
}

void testReadExchangeRateAMDRUB(ExchangeRateRepository repository) async {
  final readExchangeRateAMDRUB = ReadExchangeRateAMDRUB(repository);

  final exchangeRateOrFailure = await readExchangeRateAMDRUB(const NoParams());

  exchangeRateOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (rate) => expect(rate, StubEntities.dramToDollar),
  );
}

void testUpdateExchangeRateAMDRUB(ExchangeRateRepository repository) async {
  final updateExchangeRateAMDRUB = UpdateExchangeRateAMDRUB(repository);

  final exchangeRateOrFailure =
      await updateExchangeRateAMDRUB(StubEntities.fakeExchangeRate);

  exchangeRateOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (rate) => rate,
  );
}
