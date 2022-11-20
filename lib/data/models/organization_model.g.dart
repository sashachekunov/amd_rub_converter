// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrganizationModel _$$_OrganizationModelFromJson(Map<String, dynamic> json) =>
    _$_OrganizationModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_OrganizationModelToJson(
        _$_OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
