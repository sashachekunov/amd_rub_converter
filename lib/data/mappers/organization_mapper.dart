import 'package:amd_rub_converter/data/models/organization_model.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';

class OrganizationMapper {
  const OrganizationMapper._();

  static OrganizationEntity fromModel(OrganizationModel model) =>
      OrganizationEntity(name: model.name, image: model.image);

  static OrganizationModel fromEntity(OrganizationEntity entity) =>
      OrganizationModel(name: entity.name, image: entity.image);
}
