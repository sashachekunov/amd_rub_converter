import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';

import '../core/stub_entities.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateNiceMocks([MockSpec<OrganizationRepository>()])
import 'organization_repository.mocks.dart';

OrganizationRepository createMockedOrganizationRepository() {
  final mockRepository = MockOrganizationRepository();

  when(
    mockRepository.createOrganizations(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(null)),
  );

  when(
    mockRepository.readOrganizations(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right([StubEntities.organization])),
  );

  return mockRepository;
}

OrganizationRepository createMockedFailureOrganizationRepository() {
  final mockRepository = MockOrganizationRepository();

  when(
    mockRepository.createOrganizations(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.readOrganizations(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  return mockRepository;
}
