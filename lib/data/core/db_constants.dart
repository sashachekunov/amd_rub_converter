import 'package:amd_rub_converter/data/models/country_model.dart';
import 'package:amd_rub_converter/data/models/currency_model.dart';
import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';

class DBConstants {
  const DBConstants._();

  static const firstLaunchKey = 'is_first_launch';
  static const countriesKey = 'countries';
  static const currenciesKey = 'currencies';
  static const organizationsKey = 'organizations';
  static const cashExchangeRateAMDRUBKey = 'cash_exchange_rate_AMD_RUB';
  static const cashlessExchangeRateAMDRUBKey = 'cashless_exchange_rate_AMD_RUB';

  static const _armenia = CountryModel(id: 0, name: 'Армения', flag: '🇦🇲');
  static const _russia = CountryModel(id: 0, name: 'Россия', flag: '🇦🇲');
  static const countries = [_armenia, _russia];

  static const _armenianDram =
      CurrencyModel(id: 0, code: 'AMD', symbol: '֏', users: [_armenia]);
  static const _russianRuble =
      CurrencyModel(id: 0, code: 'RUB', symbol: '₽', users: [_russia]);
  static const currencies = [_armenianDram, _russianRuble];

  static const _tinkoff = OrganizationModel(
    id: 0,
    name: 'Тинькофф Банк',
    image:
        'https://upload.wikimedia.org/wikipedia/ru/thumb/8/86/Логотип_Тинькофф.svg/287px-Логотип_Тинькофф.svg.png',
  );
  static const _mir = OrganizationModel(
    id: 1,
    name: 'ПС МИР',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Mir-logo.SVG.svg/440px-Mir-logo.SVG.svg.png',
  );

  static const _evocabank = OrganizationModel(
    id: 2,
    name: 'Эвокабанк',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Evocabank_logo.png/500px-Evocabank_logo.png',
  );
  static const _acbabank = OrganizationModel(
    id: 3,
    name: 'Акба банк',
    image: 'https://upload.wikimedia.org/wikipedia/en/0/0a/Acba_Bank_logo.jpg',
  );
  static const _ardshinbank = OrganizationModel(
    id: 4,
    name: 'Ардшинбанк',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/f/f5/Ardshinbank_Logo.png',
  );

  static const organizations = [
    _tinkoff,
    _mir,
    _evocabank,
    _acbabank,
    _ardshinbank,
  ];

  static const exchangeRateAMDRUB = ExchangeRateModel(
    from: _armenianDram,
    to: _russianRuble,
    rate: 0,
    timestamp: 0,
    organizations: organizations,
  );
}
