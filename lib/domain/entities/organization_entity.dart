import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_entity.freezed.dart';

@freezed
class OrganizationEntity with _$OrganizationEntity {
  const factory OrganizationEntity({
    required String name,
    required String image,
  }) = _OrganizationEntity;
}
