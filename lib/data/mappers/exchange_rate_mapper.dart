import 'package:amd_rub_converter/data/mappers/currency_mapper.dart';
import 'package:amd_rub_converter/data/mappers/organization_mapper.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';

class ExchangeRateMapper {
  const ExchangeRateMapper._();

  static ExchangeRateEntity fromModel(ExchangeRateModel model) =>
      ExchangeRateEntity(
        from: CurrencyMapper.fromModel(model.from),
        to: CurrencyMapper.fromModel(model.to),
        rate: model.rate,
        timestamp: model.timestamp,
        organizations: model.organizations
            .map((e) => OrganizationMapper.fromModel(e))
            .toList(),
      );

  static ExchangeRateModel fromEntity(ExchangeRateEntity entity) =>
      ExchangeRateModel(
        from: CurrencyMapper.fromEntity(entity.from),
        to: CurrencyMapper.fromEntity(entity.to),
        rate: entity.rate,
        timestamp: entity.timestamp,
        organizations: entity.organizations
            .map((e) => OrganizationMapper.fromEntity(e))
            .toList(),
      );
}
