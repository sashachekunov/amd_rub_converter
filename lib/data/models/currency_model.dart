import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/data/models/country_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  const CurrencyModel._();

  const factory CurrencyModel({
    @Default(0) int id,
    required String code,
    required String symbol,
    required List<CountryModel> users,
  }) = _CurrencyModel;

  factory CurrencyModel.fromEntity(CurrencyEntity entity) => CurrencyModel(
        code: entity.code,
        symbol: entity.symbol,
        users: entity.users.map((e) => CountryModel.fromEntity(e)).toList(),
      );

  CurrencyEntity fromModel() => CurrencyEntity(
        code: code,
        symbol: symbol,
        users: users.map((e) => e.fromModel()).toList(),
      );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}
