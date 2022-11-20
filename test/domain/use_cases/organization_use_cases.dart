import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/use_cases/read_organizations.dart';
import 'package:amd_rub_converter/domain/use_cases/create_organizations.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testCreateOrganizations(OrganizationRepository repository) async {
  final createOrganizations = CreateOrganizations(repository);

  final voidOrFailure = await createOrganizations(const NoParams());

  voidOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (result) => result,
  );
}

void testReadOrganizations(OrganizationRepository repository) async {
  final readOrganizations = ReadOrganizations(repository);

  final organizationsOrFailure = await readOrganizations(const NoParams());

  organizationsOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (organizations) => expect(organizations, [StubEntities.organization]),
  );
}
