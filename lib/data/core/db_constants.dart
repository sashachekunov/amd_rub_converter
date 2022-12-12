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
  static const _russia = CountryModel(id: 0, name: 'Россия', flag: '🇷🇺');
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

  static const _idbank = OrganizationModel(
    id: 2,
    name: 'АйДи Банк',
    image: 'https://idbank.am/images/logo.png',
  );
  static const _acbabank = OrganizationModel(
    id: 3,
    name: 'Акба банк',
    image: 'https://upload.wikimedia.org/wikipedia/en/0/0a/Acba_Bank_logo.jpg',
  );
  static const _ameriabank = OrganizationModel(
    id: 4,
    name: 'Америабанк',
    image: 'https://upload.wikimedia.org/wikipedia/en/6/6d/Ameriabank_Logo.png',
  );
  static const _araratbank = OrganizationModel(
    id: 5,
    name: 'АраратБанк',
    image:
        'https://banks.am/static/companies/images/09ca074443513681a8e106a224a69aef.png',
  );
  static const _ardshinbank = OrganizationModel(
    id: 6,
    name: 'Ардшинбанк',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/f/f5/Ardshinbank_Logo.png',
  );
  static const _haybiznesbank = OrganizationModel(
    id: 7,
    name: 'Армбизнесбанк',
    image:
        'https://banks.am/static/companies/images/1f57a57dc1d4851b6fccc7e12a46d9be.jpg',
  );
  static const _hayekonombank = OrganizationModel(
    id: 8,
    name: 'Армсвисбанк',
    image:
        'https://banks.am/static/companies/images/c16f7c5ceceb1effc3426ab46ae7b2ec.png',
  );
  static const _armsvisbank = OrganizationModel(
    id: 9,
    name: 'АРМЭКОНОМБАНК',
    image:
        'https://banks.am/static/companies/images/d1dbe65a51a8800c3b3936150ab28c65.png',
  );
  static const _arcakhbank = OrganizationModel(
    id: 10,
    name: 'Арцахбанк',
    image:
        'https://banks.am/static/companies/images/0932995975ee7d881dba77ae696e0617.jpg',
  );
  static const _biblos = OrganizationModel(
    id: 11,
    name: 'Библос Банк Армения',
    image:
        'https://banks.am/static/companies/images/1c7825fd455f4857095442cb36cfdf43.jpg',
  );
  static const _vtbhayastan = OrganizationModel(
    id: 12,
    name: 'ВТБ Армения',
    image:
        'https://banks.am/static/companies/images/5a8ee6ee29b5852f596b05247c544876.png',
  );
  static const _inekobank = OrganizationModel(
    id: 13,
    name: 'Инекобанк',
    image:
        'https://banks.am/static/companies/images/42541bbfc472925ac6181bfc58645678.jpg',
  );
  static const _konvers = OrganizationModel(
    id: 14,
    name: 'Конверс Банк',
    image: 'https://banks.am/static/companies/images////091313170037.jpg',
  );
  static const _mellat = OrganizationModel(
    id: 15,
    name: 'Меллат Банк',
    image: 'https://banks.am/static/companies/images////091141114119.jpg',
  );
  static const _fastbank = OrganizationModel(
    id: 16,
    name: 'Фаст Банк',
    image:
        'https://banks.am/static/companies/images/225e11d13197fdc0a8b5b1dd8f99976a.png',
  );
  static const _evocabank = OrganizationModel(
    id: 17,
    name: 'Эвокабанк',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Evocabank_logo.png/500px-Evocabank_logo.png',
  );
  static const _eychesbisi = OrganizationModel(
    id: 18,
    name: 'Эйч-Эс-Би-Си Банк Армения',
    image:
        'https://banks.am/static/companies/images/d8b6d081b18e301c5f0dd57db76896cf.png',
  );
  static const _yunibank = OrganizationModel(
    id: 19,
    name: 'Юнибанк/Армения',
    image:
        'https://banks.am/static/companies/images/321d16a145ae0506d89dcc2684ee4e8b.jpg',
  );

  static const organizations = [
    _tinkoff,
    _mir,
    _idbank,
    _acbabank,
    _ameriabank,
    _araratbank,
    _ardshinbank,
    _haybiznesbank,
    _hayekonombank,
    _armsvisbank,
    _arcakhbank,
    _biblos,
    _vtbhayastan,
    _inekobank,
    _konvers,
    _mellat,
    _fastbank,
    _evocabank,
    _eychesbisi,
    _yunibank
  ];

  static const exchangeRateAMDRUB = ExchangeRateModel(
    from: _armenianDram,
    to: _russianRuble,
    rate: 0,
    timestamp: 0,
    organizations: organizations,
  );
}
