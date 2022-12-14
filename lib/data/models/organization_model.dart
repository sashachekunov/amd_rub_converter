import 'package:amd_rub_converter/domain/entities/organization_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  const OrganizationModel._();

  const factory OrganizationModel({
    @Default(0) int id,
    required String name,
    required String image,
  }) = _OrganizationModel;

  factory OrganizationModel.fromEntity(OrganizationEntity entity) =>
      OrganizationModel(name: entity.name, image: entity.image);

  OrganizationEntity fromModel() =>
      OrganizationEntity(name: name, image: image);

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}
