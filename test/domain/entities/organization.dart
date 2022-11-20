import 'package:amd_rub_converter/domain/entities/organization_entity.dart';

import 'package:test/test.dart';

void testOrganizationConstructor() {
  final organization = createOrganizationEntity();

  expect(organization.getFieldsString(), 'bank/image.jpg');
}

void testOrganizationCopyWithMethod() {
  final organization =
      createOrganizationEntity().copyWith(name: 'another_bank');

  expect(organization.getFieldsString(), 'another_bank/image.jpg');
}

void testOrganizationEquality() {
  final organization0 = createOrganizationEntity();
  final organization1 =
      createOrganizationEntity().copyWith(name: 'another_bank');

  expect(organization0 == organization1, false);
}

OrganizationEntity createOrganizationEntity() =>
    const OrganizationEntity(name: 'bank', image: '/image.jpg');

extension Stringification on OrganizationEntity {
  String getFieldsString() => '$name' '$image';
}
