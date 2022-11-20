import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_entity.freezed.dart';

@freezed
class ExchangeRateEntity with _$ExchangeRateEntity {
  const ExchangeRateEntity._();

  const factory ExchangeRateEntity({
    required CurrencyEntity from,
    required CurrencyEntity to,
    required double rate,
    required int timestamp,
    required List<OrganizationEntity> organizations,
  }) = _ExchangeRateEntity;

  double convert(double amount) => amount * rate;
}
