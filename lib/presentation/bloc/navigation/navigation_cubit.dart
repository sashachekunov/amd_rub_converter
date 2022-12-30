import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/use_cases/read_exchange_rate_amd_rub.dart';
import 'package:amd_rub_converter/domain/use_cases/is_exchange_rate_valid.dart';
import 'package:amd_rub_converter/domain/use_cases/write_first_launch.dart';
import 'package:amd_rub_converter/domain/use_cases/is_first_launch.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/presentation/core/routes.dart';

import 'package:bloc/bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final IsFirstLaunch _isFirstLaunch;
  final WriteFirstLaunch _writeFirstLaunch;
  final IsExchangeRateValid _isExchangeRateValid;
  final ReadExchangeRateAMDRUB _readExchangeRateAMDRUB;

  static const _noParams = NoParams();
  static const _defaultState = CurrencyConverter();

  NavigationCubit(
    this._isFirstLaunch,
    this._writeFirstLaunch,
    this._isExchangeRateValid,
    this._readExchangeRateAMDRUB,
  ) : super(_defaultState);

  void initNavigationState() async {
    if (await _checkFirstLaunch()) return emit(const ExchangeRateEditor());

    final exchangeRatesValid = await _validateExchangeRates();
    if (exchangeRatesValid == null) return emit(const ExchangeRateEditor());

    if (exchangeRatesValid) emit(const ExchangeRateEditor(CurrencyConverter()));
  }

  void setNavigationState(
    NavigationState newState, [
    bool forgetPrevState = false,
  ]) {
    if (state.runtimeType == newState.runtimeType) return;

    if (forgetPrevState) return emit(newState);

    if (newState is CurrencyConverter) {
      emit(CurrencyConverter(state));
    } else if (newState is ExchangeRateEditor) {
      emit(ExchangeRateEditor(state));
    } else if (newState is ErrorNotFound) {
      emit(ErrorNotFound(state));
    }
  }

  void resetPrevNavigationState() => emit(state.prevState ?? _defaultState);

  Future<bool> _checkFirstLaunch() async {
    final isFirstLaunchOrFailure = await _isFirstLaunch(_noParams);

    final firstLaunch = isFirstLaunchOrFailure.fold<bool>(
      (failure) => true,
      (firstLaunch) => firstLaunch,
    );

    if (firstLaunch) {
      await _writeFirstLaunch(_noParams);
      return true;
    }

    return false;
  }

  Future<bool?> _validateExchangeRates() async {
    final cashlessExchangeRate = await _readExchangeRate(true);
    final cashExchangeRate = await _readExchangeRate(false);

    if (cashlessExchangeRate == null || cashExchangeRate == null) return null;

    final cashlessExchangeRateValid =
        await _exchangeRateValid(cashlessExchangeRate.timestamp);
    final cashExchangeRateValid =
        await _exchangeRateValid(cashExchangeRate.timestamp);

    if (!cashlessExchangeRateValid || !cashExchangeRateValid) {
      return true;
    }

    return false;
  }

  Future<bool> _exchangeRateValid(int timestamp) async {
    final exchangeRateValidOrFailure = await _isExchangeRateValid(timestamp);

    return exchangeRateValidOrFailure.fold<bool>(
      (failure) => false,
      (valid) => valid,
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
