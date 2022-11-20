import 'package:amd_rub_converter/data/models/country_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    @Default(0) int id,
    required String code,
    required String symbol,
    required List<CountryModel> users,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}
