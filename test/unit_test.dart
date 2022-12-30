import 'package:amd_rub_converter/domain/repositories/app_repository.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';

import 'data/core/db_client.dart';
import 'data/models/country.dart';
import 'data/models/currency.dart';
import 'data/models/organization.dart';
import 'data/models/exchange_rate.dart';
import 'domain/entities/country.dart';
import 'domain/entities/currency.dart';
import 'domain/entities/organization.dart';
import 'domain/entities/exchange_rate.dart';
import 'domain/use_cases/app_use_cases.dart';
import 'domain/use_cases/currency_use_cases.dart';
import 'domain/use_cases/organization_use_cases.dart';
import 'domain/use_cases/exchange_rate_use_cases.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/repositories/currency_repository.dart';
import 'domain/repositories/organization_repository.dart';
import 'domain/repositories/exchange_rate_repository.dart';
import 'data/data_sources/app_local_data_source.dart' as app_local_ds;
import 'data/data_sources/currency_local_data_source.dart' as currency_local_ds;
import 'data/data_sources/organization_local_data_source.dart'
    as organization_local_ds;
import 'data/data_sources/exchange_rate_local_data_source.dart'
    as exchange_rate_local_ds;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  group('Entities tests', () {
    group('Country', () {
      test('constructor', testCountryConstructor);

      test('copyWith', testCountryCopyWithMethod);

      test('equality', testCountryEquality);
    });

    group('Currency', () {
      test('constructor', testCurrencyConstructor);

      test('copyWith', testCurrencyCopyWithMethod);

      test('equality', testCurrencyEquality);
    });

    group('Organization', () {
      test('constructor', testOrganizationConstructor);

      test('copyWith', testOrganizationCopyWithMethod);

      test('equality', testOrganizationEquality);
    });

    group('ExchangeRate', () {
      test('constructor', testExchangeRateConstructor);

      test('copyWith', testExchangeRateCopyWithMethod);

      test('equality', testExchangeRateEquality);

      test('convert', testExchangeRateConvert);
    });
  });

  group('UseCases tests', () {
    group('App', () {
      late AppRepository repository;
      late AppRepository failureRepository;

      setUp(() {
        repository = createMockedAppRepository();
        failureRepository = createMockedFailureAppRepository();
      });

      test('IsFirstLaunch success', () => testIsFirstLaunch(repository));

      test('IsFirstLaunch failure', () => testIsFirstLaunch(failureRepository));

      test('WriteFirstLaunch success', () => testWriteFirstLaunch(repository));

      test('WriteFirstLaunch failure',
          () => testWriteFirstLaunch(failureRepository));
    });

    group('Currency', () {
      late CurrencyRepository repository;
      late CurrencyRepository failureRepository;

      setUp(() {
        repository = createMockedCurrencyRepository();
        failureRepository = createMockedFailureCurrencyRepository();
      });

      test('CreateCurrencies success', () => testCreateCurrencies(repository));

      test('CreateCurrencies failure',
          () => testCreateCurrencies(failureRepository));

      test('ReadCurrencies success', () => testReadCurrencies(repository));

      test('ReadCurrencies failure',
          () => testReadCurrencies(failureRepository));
    });

    group('Organization', () {
      late OrganizationRepository repository;
      late OrganizationRepository failureRepository;

      setUp(() {
        repository = createMockedOrganizationRepository();
        failureRepository = createMockedFailureOrganizationRepository();
      });

      test('CreateOrganizations success',
          () => testCreateOrganizations(repository));

      test('CreateOrganizations failure',
          () => testCreateOrganizations(failureRepository));

      test(
          'ReadOrganizations success', () => testReadOrganizations(repository));

      test('ReadOrganizations failure',
          () => testReadOrganizations(failureRepository));
    });

    group('ExchangeRate', () {
      late ExchangeRateRepository repository;
      late ExchangeRateRepository failureRepository;

      setUp(() {
        repository = createMockedExchangeRateRepository();
        failureRepository = createMockedFailureExchangeRateRepository();
      });

      test('IsExchangeRateValid success',
          () => testIsExchangeRateValid(repository));

      test('IsExchangeRateValid failure',
          () => testIsExchangeRateValid(failureRepository));

      test('ConvertCurrency success', () => testConvertCurrency(repository));

      test('ConvertCurrency failure',
          () => testConvertCurrency(failureRepository));

      test('ReadExchangeRateAMDRUB success',
          () => testReadExchangeRateAMDRUB(repository));

      test('ReadExchangeRateAMDRUB failure',
          () => testReadExchangeRateAMDRUB(failureRepository));

      test('UpdateExchangeRateAMDRUB success',
          () => testUpdateExchangeRateAMDRUB(repository));

      test('UpdateExchangeRateAMDRUB failure',
          () => testUpdateExchangeRateAMDRUB(failureRepository));
    });
  });

  group('Models tests', () {
    group('Country', () {
      test('toJson', testCountryToJson);

      test('fromJson', testCountryFromJson);
    });

    group('Currency', () {
      test('toJson', testCurrencyToJson);

      test('fromJson', testCurrencyFromJson);
    });

    group('Organization', () {
      test('toJson', testOrganizationToJson);

      test('fromJson', testOrganizationFromJson);
    });

    group('ExchangeRate', () {
      test('toJson', testExchangeRateToJson);

      test('fromJson', testExchangeRateFromJson);
    });
  });

  group('DBClient tests', () {
    late SharedPreferences preferences;
    late SharedPreferences failurePreferences;

    setUp(() async {
      preferences = await createMockedSharedPreferences();
      failurePreferences = await createMockedSharedPreferencesWithExceptions();
    });

    test('Read', () => testRead(preferences));

    test('Read exception', () => testRead(failurePreferences));

    test('Write', () => testWrite(preferences));
  });

  group('DataSources tests', () {
    late SharedPreferences preferences;
    late SharedPreferences failurePreferences;

    setUp(() async {
      preferences = await createMockedSharedPreferences();
      failurePreferences = await createMockedSharedPreferencesWithExceptions();
    });

    group('App', () {
      test('ReadFirstLaunch success',
          () => app_local_ds.testReadFirstLaunch(preferences));

      test('ReadFirstLaunch exception',
          () => app_local_ds.testReadFirstLaunch(failurePreferences));

      test('WriteFirstLaunch success',
          () => app_local_ds.testWriteFirstLaunch(preferences));
    });

    group('Currency', () {
      test('ReadCurrencies success',
          () => currency_local_ds.testReadCurrencies(preferences));

      test('ReadCurrencies exception',
          () => currency_local_ds.testReadCurrencies(failurePreferences));

      test('CreateCurrencies success',
          () => currency_local_ds.testCreateCurrencies(preferences));
    });

    group('Organization', () {
      test('ReadOrganizations success',
          () => organization_local_ds.testReadOrganizations(preferences));

      test(
          'ReadOrganizations exception',
          () =>
              organization_local_ds.testReadOrganizations(failurePreferences));

      test('CreateOrganizations success',
          () => organization_local_ds.testCreateOrganizations(preferences));
    });

    group('ExchangeRate', () {
      test('ConvertCurrency', () => exchange_rate_local_ds.testConvertCurrency);

      test('IsExchangeRateValid',
          () => exchange_rate_local_ds.testIsExchangeRateValid);

      test('ReadExchangeRateAMDRUB success',
          () => exchange_rate_local_ds.testReadExchangeRateAMDRUB(preferences));

      test(
          'ReadExchangeRateAMDRUB exception',
          () => exchange_rate_local_ds
              .testReadExchangeRateAMDRUB(failurePreferences));

      test(
          'UpdateExchangeRateAMDRUB success',
          () =>
              exchange_rate_local_ds.testUpdateExchangeRateAMDRUB(preferences));
    });
  });
}
