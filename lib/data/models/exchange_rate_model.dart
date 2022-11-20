import 'package:amd_rub_converter/data/models/currency_model.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_model.freezed.dart';
part 'exchange_rate_model.g.dart';

@freezed
class ExchangeRateModel with _$ExchangeRateModel {
  const factory ExchangeRateModel({
    @Default(0) int id,
    required CurrencyModel from,
    required CurrencyModel to,
    required double rate,
    required int timestamp,
    required List<OrganizationModel> organizations,
  }) = _ExchangeRateModel;

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateModelFromJson(json);
}
