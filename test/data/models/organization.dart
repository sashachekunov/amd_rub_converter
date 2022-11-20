import 'package:amd_rub_converter/data/models/organization_model.dart';
import 'package:amd_rub_converter/data/mappers/organization_mapper.dart';

import '../../domain/core/stub_entities.dart';
import '../core/stub_responses.dart';

import 'package:test/test.dart';

void testOrganizationToJson() {
  final model = createOrganizationModel();

  expect(
    StubResponses.getEncodedJson(model.toJson()),
    StubResponses.getEncodedJson(StubResponses.organization),
  );
}

void testOrganizationFromJson() {
  final model = createOrganizationModelFromJson();

  expect(model, createOrganizationModel());
}

OrganizationModel createOrganizationModel() =>
    OrganizationMapper.fromEntity(StubEntities.organization);

OrganizationModel createOrganizationModelFromJson() =>
    OrganizationModel.fromJson(StubResponses.organization);
