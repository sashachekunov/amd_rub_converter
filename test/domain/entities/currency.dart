import 'package:amd_rub_converter/domain/entities/currency_entity.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testCurrencyConstructor() {
  final armenianDram = createCurrencyEntity();

  expect(armenianDram.getFieldsString(), 'AMD֏[Armenia🇦🇲]');
}

void testCurrencyCopyWithMethod() {
  final unitedStatesDollar = createCurrencyEntity().copyWith(
    code: 'USD',
    symbol: '\$',
    users: const [StubEntities.usa],
  );

  expect(unitedStatesDollar.getFieldsString(), 'USD\$[USA🇺🇸]');
}

void testCurrencyEquality() {
  final armenianDram = createCurrencyEntity();
  final unitedStatesDollar = createCurrencyEntity().copyWith(
    code: 'USD',
    symbol: '\$',
    users: const [StubEntities.usa],
  );

  expect(armenianDram == unitedStatesDollar, false);
}

CurrencyEntity createCurrencyEntity() => const CurrencyEntity(
      code: 'AMD',
      symbol: '֏',
      users: [StubEntities.armenia],
    );

extension Stringification on CurrencyEntity {
  String getFieldsString() =>
      '$code' '$symbol' '${users.map((e) => e.name + e.flag).toList()}';
}
