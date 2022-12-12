import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/use_cases/convert_currency.dart';
import 'package:amd_rub_converter/domain/use_cases/read_currencies.dart';
import 'package:amd_rub_converter/domain/use_cases/read_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/use_cases/read_organizations.dart';
import 'package:amd_rub_converter/domain/use_cases/update_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'converter_state.dart';

import 'package:bloc/bloc.dart';

class ConverterCubit extends Cubit<ConverterState> {
  final UpdateExchangeRateAMDRUB _updateExchangeRate;
  final ReadOrganizations _readOrganizations;
  final ReadCurrencies _readCurrencies;
  final ReadExchangeRateAMDRUB _readExchangeRateAMDRUB;
  final ConvertCurrency _convertCurrency;

  ConverterCubit(
    this._updateExchangeRate,
    this._readOrganizations,
    this._readCurrencies,
    this._readExchangeRateAMDRUB,
    this._convertCurrency,
  ) : super(const ConverterState());

  Future<bool> _validateExchangeRates() async {
    final cashlessExchangeRate = await _readExchangeRate(true);
    final cashExchangeRate = await _readExchangeRate(false);

    if (cashlessExchangeRate == null || cashExchangeRate == null) return true;

    updateExchangeRates(cashExchangeRate, cashlessExchangeRate);
    return false;
  }

  void initConverterState() async {
    if (!(await _validateExchangeRates())) return;

    final currencies = (await _readAllCurrencies());
    if (currencies.isEmpty) return;

    final exchangeRate = ExchangeRateEntity(
      from: currencies.first,
      to: currencies.last,
      rate: 0,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      organizations: const [],
    );

    emit(state.copyWith(
      cashExchangeRate: exchangeRate,
      cashlessExchangeRate: exchangeRate,
      organizations: await _readAllOrganizations(),
    ));
  }

  Future<double> convert(double amount) async {
    if (state.exchangeRate == null) return 0;

    return (await _convertCurrency(
            ConvertCurrencyParams(amount, state.exchangeRate!)))
        .fold((l) => 0, (result) => result);
  }

  Future<void> updateExchangeRates(
    ExchangeRateEntity cashExchangeRate,
    ExchangeRateEntity cashlessExchangeRate,
  ) async {
    await _updateExchangeRate(
      UpdateExchangeRateAMDRUBParams(false, cashExchangeRate),
    );
    await _updateExchangeRate(
        UpdateExchangeRateAMDRUBParams(true, cashlessExchangeRate));

    emit(state.copyWith(
      cashExchangeRate: cashExchangeRate,
      cashlessExchangeRate: cashlessExchangeRate,
      organizations: state.organizations.isEmpty
          ? await _readAllOrganizations()
          : state.organizations,
    ));
  }

  void switchCashlessMode() => emit(state.copyWith(cashless: !state.cashless));

  Future<List<OrganizationEntity>> _readAllOrganizations() async {
    const noParams = NoParams();

    final organizationsOrFailure = await _readOrganizations(noParams);

    return organizationsOrFailure.fold(
      (l) => const <OrganizationEntity>[],
      (organizations) => organizations,
    );
  }

  Future<List<CurrencyEntity>> _readAllCurrencies() async {
    const noParams = NoParams();

    final currenciesOrFailure = await _readCurrencies(noParams);
    return currenciesOrFailure.fold(
      (l) => const <CurrencyEntity>[],
      (currencies) => currencies,
    );
  }

  Future<ExchangeRateEntity?> _readExchangeRate(bool cashless) async {
    final exchangeRateOrFailure = await _readExchangeRateAMDRUB(cashless);

    return exchangeRateOrFailure.fold<ExchangeRateEntity?>(
      (failure) => null,
      (exchangeRate) => exchangeRate,
    );
  }
}
