import 'package:amd_rub_converter/domain/entities/country_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.freezed.dart';

@freezed
class CurrencyEntity with _$CurrencyEntity {
  const factory CurrencyEntity({
    required String code,
    required String symbol,
    required List<CountryEntity> users,
  }) = _CurrencyEntity;
}
