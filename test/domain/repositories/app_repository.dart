import 'package:amd_rub_converter/domain/repositories/app_repository.dart';

import '../core/stub_entities.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
import 'app_repository.mocks.dart';

AppRepository createMockedAppRepository() {
  final mockRepository = MockAppRepository();

  when(
    mockRepository.isFirstLaunch(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(true)),
  );

  when(
    mockRepository.writeFirstLaunch(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(null)),
  );

  return mockRepository;
}

AppRepository createMockedFailureAppRepository() {
  final mockRepository = MockAppRepository();

  when(
    mockRepository.isFirstLaunch(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.writeFirstLaunch(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  return mockRepository;
}
