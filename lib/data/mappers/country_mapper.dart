import 'package:amd_rub_converter/data/models/country_model.dart';
import 'package:amd_rub_converter/domain/entities/country_entity.dart';

class CountryMapper {
  const CountryMapper._();

  static CountryEntity fromModel(CountryModel model) =>
      CountryEntity(name: model.name, flag: model.flag);

  static CountryModel fromEntity(CountryEntity entity) =>
      CountryModel(name: entity.name, flag: entity.flag);
}
