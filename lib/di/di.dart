import 'package:amd_rub_converter/data/core/db_client.dart';

import 'package:amd_rub_converter/data/data_sources/app_local_data_source.dart';
import 'package:amd_rub_converter/data/data_sources/currency_local_data_source.dart';
import 'package:amd_rub_converter/data/data_sources/organization_local_data_source.dart';
import 'package:amd_rub_converter/data/data_sources/exchange_rate_local_data_source.dart';

import 'package:amd_rub_converter/data/repositories/app_repository_impl.dart';
import 'package:amd_rub_converter/data/repositories/currency_repository_impl.dart';
import 'package:amd_rub_converter/data/repositories/organization_repository_impl.dart';
import 'package:amd_rub_converter/data/repositories/exchange_rate_repository_impl.dart';

import 'package:amd_rub_converter/domain/repositories/app_repository.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';

import 'package:amd_rub_converter/domain/use_cases/read_currencies.dart';
import 'package:amd_rub_converter/domain/use_cases/is_first_launch.dart';
import 'package:amd_rub_converter/domain/use_cases/convert_currency.dart';
import 'package:amd_rub_converter/domain/use_cases/create_currencies.dart';
import 'package:amd_rub_converter/domain/use_cases/read_organizations.dart';
import 'package:amd_rub_converter/domain/use_cases/write_first_launch.dart';
import 'package:amd_rub_converter/domain/use_cases/create_organizations.dart';
import 'package:amd_rub_converter/domain/use_cases/is_exchange_rate_valid.dart';
import 'package:amd_rub_converter/domain/use_cases/read_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/use_cases/update_exchange_rate_amd_rub.dart';

import 'package:amd_rub_converter/presentation/bloc/converter/converter_cubit.dart';
import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:amd_rub_converter/presentation/core/local_notifications.dart';

import 'package:amd_rub_converter/presentation/router/router_delegate_impl.dart';
import 'package:amd_rub_converter/presentation/router/back_button_dispatcher_impl.dart';
import 'package:amd_rub_converter/presentation/router/route_information_parser_impl.dart';
import 'package:amd_rub_converter/presentation/router/route_information_provider_impl.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

const di = DependencyInjector();

class DependencyInjector {
  const DependencyInjector();

  static final _getItInstance = GetIt.instance;

  Future<void> init() async {
    await _registerDBClient();
    await registerLocalNotifications();
    _registerDataSources();
    _registerRepositories();
    _registerUseCases();
    _registerCubits();
    _registerRouter();
  }

  Future<void> _registerDBClient() async {
    final preferences = await SharedPreferences.getInstance();
    _getItInstance.registerLazySingleton<DBClient>(() => DBClient(preferences));
  }

  void _registerDataSources() {
    _getItInstance.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSourceImpl(_client, _localNotifications),
    );
    _getItInstance.registerLazySingleton<CurrencyLocalDataSource>(
      () => CurrencyLocalDataSourceImpl(_client),
    );
    _getItInstance.registerLazySingleton<ExchangeRateLocalDataSource>(
      () => ExchangeRateLocalDataSourceImpl(_client),
    );
    _getItInstance.registerLazySingleton<OrganizationLocalDataSource>(
      () => OrganizationLocalDataSourceImpl(_client),
    );
  }

  void _registerRepositories() {
    _getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(_appLocalDataSource),
    );
    _getItInstance.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl(_currencyLocalDataSource),
    );
    _getItInstance.registerLazySingleton<ExchangeRateRepository>(
      () => ExchangeRateRepositoryImpl(_exchangeRateLocalDataSource),
    );
    _getItInstance.registerLazySingleton<OrganizationRepository>(
      () => OrganizationRepositoryImpl(_organizationLocalDataSource),
    );
  }

  void _registerUseCases() {
    _getItInstance.registerLazySingleton<ConvertCurrency>(
      () => ConvertCurrency(_exchangeRateRepository),
    );
    _getItInstance.registerLazySingleton<CreateCurrencies>(
      () => CreateCurrencies(_currencyRepository),
    );
    _getItInstance.registerLazySingleton<CreateOrganizations>(
      () => CreateOrganizations(_organizationRepository),
    );
    _getItInstance.registerLazySingleton<IsExchangeRateValid>(
      () => IsExchangeRateValid(_exchangeRateRepository),
    );
    _getItInstance.registerLazySingleton<IsFirstLaunch>(
      () => IsFirstLaunch(_appRepository),
    );
    _getItInstance.registerLazySingleton<ReadCurrencies>(
      () => ReadCurrencies(_currencyRepository),
    );
    _getItInstance.registerLazySingleton<ReadExchangeRateAMDRUB>(
      () => ReadExchangeRateAMDRUB(_exchangeRateRepository),
    );
    _getItInstance.registerLazySingleton<ReadOrganizations>(
      () => ReadOrganizations(_organizationRepository),
    );
    _getItInstance.registerLazySingleton<UpdateExchangeRateAMDRUB>(
      () => UpdateExchangeRateAMDRUB(_exchangeRateRepository),
    );
    _getItInstance.registerLazySingleton<WriteFirstLaunch>(
      () => WriteFirstLaunch(_appRepository),
    );
  }

  void _registerCubits() {
    _getItInstance.registerFactory(
      () => NavigationCubit(
        _isFirstLaunch,
        _writeFirstLaunch,
        _isExchangeRateValid,
        _readExchangeRateAMDRUB,
      ),
    );
    _getItInstance.registerFactory(
      () => ConverterCubit(
        _updateExchangeRateAMDRUB,
        _readOrganizations,
        _readCurrencies,
        _readExchangeRateAMDRUB,
        _convertCurrency,
        _createCurrencies,
        _createOrganizations,
      ),
    );
  }

  void _registerRouter() {
    _getItInstance.registerLazySingleton<RouteInformationProviderImpl>(
      () => RouteInformationProviderImpl(),
    );
    _getItInstance.registerLazySingleton<RouteInformationParserImpl>(
      () => const RouteInformationParserImpl(),
    );
    _getItInstance.registerLazySingleton<RouterDelegateImpl>(
      () => RouterDelegateImpl(_navigationCubit),
    );
    _getItInstance.registerLazySingleton<BackButtonDispatcherImpl>(
      () => BackButtonDispatcherImpl(),
    );
  }

  Future<void> registerLocalNotifications() async {
    final localNotifications =
        LocalNotifications(FlutterLocalNotificationsPlugin());
    await localNotifications.initAndSetup();

    localNotifications.scheduleNotification(
        DateTime.now().add(const Duration(seconds: 5)).millisecondsSinceEpoch);

    _getItInstance
        .registerLazySingleton<LocalNotifications>(() => localNotifications);
  }

  LocalNotifications get _localNotifications =>
      _getItInstance.get<LocalNotifications>();
  NotificationDetails get notificationDetails =>
      _getItInstance.get<NotificationDetails>();

  ConverterCubit get converterCubit => _getItInstance<ConverterCubit>();
  NavigationCubit get _navigationCubit => _getItInstance<NavigationCubit>();

  RouteInformationProviderImpl get routeInformationProvider =>
      _getItInstance<RouteInformationProviderImpl>();
  RouteInformationParserImpl get routeInformationParser =>
      _getItInstance<RouteInformationParserImpl>();
  RouterDelegateImpl get routerDelegate => _getItInstance<RouterDelegateImpl>();
  BackButtonDispatcherImpl get backButtonDispatcher =>
      _getItInstance<BackButtonDispatcherImpl>();

  DBClient get _client => _getItInstance<DBClient>();

  AppLocalDataSource get _appLocalDataSource =>
      _getItInstance<AppLocalDataSource>();
  CurrencyLocalDataSource get _currencyLocalDataSource =>
      _getItInstance<CurrencyLocalDataSource>();
  ExchangeRateLocalDataSource get _exchangeRateLocalDataSource =>
      _getItInstance<ExchangeRateLocalDataSource>();
  OrganizationLocalDataSource get _organizationLocalDataSource =>
      _getItInstance<OrganizationLocalDataSource>();

  AppRepository get _appRepository => _getItInstance<AppRepository>();
  CurrencyRepository get _currencyRepository =>
      _getItInstance<CurrencyRepository>();
  ExchangeRateRepository get _exchangeRateRepository =>
      _getItInstance<ExchangeRateRepository>();
  OrganizationRepository get _organizationRepository =>
      _getItInstance<OrganizationRepository>();

  ConvertCurrency get _convertCurrency => _getItInstance<ConvertCurrency>();
  CreateCurrencies get _createCurrencies => _getItInstance<CreateCurrencies>();
  CreateOrganizations get _createOrganizations =>
      _getItInstance<CreateOrganizations>();
  IsExchangeRateValid get _isExchangeRateValid =>
      _getItInstance<IsExchangeRateValid>();
  IsFirstLaunch get _isFirstLaunch => _getItInstance<IsFirstLaunch>();
  ReadCurrencies get _readCurrencies => _getItInstance<ReadCurrencies>();
  ReadExchangeRateAMDRUB get _readExchangeRateAMDRUB =>
      _getItInstance<ReadExchangeRateAMDRUB>();
  ReadOrganizations get _readOrganizations =>
      _getItInstance<ReadOrganizations>();
  UpdateExchangeRateAMDRUB get _updateExchangeRateAMDRUB =>
      _getItInstance<UpdateExchangeRateAMDRUB>();
  WriteFirstLaunch get _writeFirstLaunch => _getItInstance<WriteFirstLaunch>();
}
