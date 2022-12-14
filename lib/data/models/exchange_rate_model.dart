import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';
import 'package:amd_rub_converter/data/models/currency_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_model.freezed.dart';
part 'exchange_rate_model.g.dart';

@freezed
class ExchangeRateModel with _$ExchangeRateModel {
  const ExchangeRateModel._();

  const factory ExchangeRateModel({
    @Default(0) int id,
    required CurrencyModel from,
    required CurrencyModel to,
    required double rate,
    required int timestamp,
    required List<OrganizationModel> organizations,
  }) = _ExchangeRateModel;

  factory ExchangeRateModel.fromEntity(ExchangeRateEntity entity) =>
      ExchangeRateModel(
        from: CurrencyModel.fromEntity(entity.from),
        to: CurrencyModel.fromEntity(entity.to),
        rate: entity.rate,
        timestamp: entity.timestamp,
        organizations: entity.organizations
            .map((e) => OrganizationModel.fromEntity(e))
            .toList(),
      );

  ExchangeRateEntity fromModel() => ExchangeRateEntity(
        from: from.fromModel(),
        to: to.fromModel(),
        rate: rate,
        timestamp: timestamp,
        organizations: organizations.map((e) => e.fromModel()).toList(),
      );

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateModelFromJson(json);
}
