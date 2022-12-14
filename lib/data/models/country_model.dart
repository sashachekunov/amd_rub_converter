import 'package:amd_rub_converter/domain/entities/country_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const CountryModel._();

  const factory CountryModel({
    @Default(0) int id,
    required String name,
    required String flag,
  }) = _CountryModel;

  factory CountryModel.fromEntity(CountryEntity entity) =>
      CountryModel(name: entity.name, flag: entity.flag);

  CountryEntity fromModel() => CountryEntity(name: name, flag: flag);

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
