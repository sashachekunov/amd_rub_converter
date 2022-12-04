import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_state.freezed.dart';

@freezed
class ConverterState with _$ConverterState {
  const ConverterState._();

  const factory ConverterState({
    ExchangeRateEntity? cashExchangeRate,
    ExchangeRateEntity? cashlessExchangeRate,
    @Default([]) List<OrganizationEntity> organizations,
    @Default(true) bool cashless,
  }) = _ConverterState;

  ExchangeRateEntity? get exchangeRate =>
      cashless ? cashlessExchangeRate : cashExchangeRate;
}
