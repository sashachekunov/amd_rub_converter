import 'package:amd_rub_converter/data/models/currency_model.dart';
import 'package:amd_rub_converter/data/mappers/country_mapper.dart';
import 'package:amd_rub_converter/domain/entities/currency_entity.dart';

class CurrencyMapper {
  const CurrencyMapper._();

  static CurrencyEntity fromModel(CurrencyModel model) => CurrencyEntity(
        code: model.code,
        symbol: model.symbol,
        users: model.users.map((e) => CountryMapper.fromModel(e)).toList(),
      );

  static CurrencyModel fromEntity(CurrencyEntity entity) => CurrencyModel(
        code: entity.code,
        symbol: entity.symbol,
        users: entity.users.map((e) => CountryMapper.fromEntity(e)).toList(),
      );
}
