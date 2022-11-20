import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    @Default(0) int id,
    required String name,
    required String flag,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
