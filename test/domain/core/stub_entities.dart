import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/country_entity.dart';
import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';

class StubEntities {
  const StubEntities._();

  static const failure = Failure(FailureType.unknown);

  static const armenia = CountryEntity(name: 'Armenia', flag: '🇦🇲');

  static const usa = CountryEntity(name: 'USA', flag: '🇺🇸');

  static const armenianDram = CurrencyEntity(
    code: 'AMD',
    symbol: '֏',
    users: [armenia],
  );

  static const unitedStatesDollar = CurrencyEntity(
    code: 'USD',
    symbol: '\$',
    users: [usa],
  );

  static const organization =
      OrganizationEntity(name: 'bank', image: '/image.jpg');

  static const dramToDollar = ExchangeRateEntity(
    from: armenianDram,
    to: unitedStatesDollar,
    rate: 0.0025,
    timestamp: 1668941823,
    organizations: [organization],
  );

  static const dollarToDram = ExchangeRateEntity(
    from: unitedStatesDollar,
    to: armenianDram,
    rate: 395.18,
    timestamp: 1668941823,
    organizations: [organization],
  );

  static const fakeExchangeRate = ExchangeRateEntity(
    from: StubEntities.armenianDram,
    to: StubEntities.unitedStatesDollar,
    rate: 0.1001,
    timestamp: 1,
    organizations: [],
  );
}
