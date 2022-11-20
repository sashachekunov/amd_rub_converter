import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testExchangeRateConstructor() {
  final dramToDollar = createExchangeRateEntity();

  expect(dramToDollar.getFieldsString(), 'AMDUSD0.00251668941823');
}

void testExchangeRateCopyWithMethod() {
  final dollarToDram = createExchangeRateEntity().copyWith(
    from: StubEntities.unitedStatesDollar,
    to: StubEntities.armenianDram,
    rate: 395.18,
  );

  expect(dollarToDram.getFieldsString(), 'USDAMD395.181668941823');
}

void testExchangeRateEquality() {
  final dramToDollar = createExchangeRateEntity();
  final dollarToDram = createExchangeRateEntity().copyWith(
    from: StubEntities.unitedStatesDollar,
    to: StubEntities.armenianDram,
    rate: 395.18,
  );

  expect(dramToDollar == dollarToDram, false);
}

void testExchangeRateConvert() {
  final dramToDollar = createExchangeRateEntity();

  final dollars = dramToDollar.convert(10000);

  expect(dollars, 10000 * dramToDollar.rate);
}

ExchangeRateEntity createExchangeRateEntity() => const ExchangeRateEntity(
      from: StubEntities.armenianDram,
      to: StubEntities.unitedStatesDollar,
      rate: 0.0025,
      timestamp: 1668941823,
      organizations: [StubEntities.organization],
    );

extension Stringification on ExchangeRateEntity {
  String getFieldsString() => '${from.code}' '${to.code}' '$rate' '$timestamp';
}
