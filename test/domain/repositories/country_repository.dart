import 'package:amd_rub_converter/domain/repositories/country_repository.dart';

import '../core/stub_entities.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateNiceMocks([MockSpec<CountryRepository>()])
import 'country_repository.mocks.dart';

CountryRepository createMockedCountryRepository() {
  final mockRepository = MockCountryRepository();

  when(
    mockRepository.createCountries(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(null)),
  );

  when(
    mockRepository.readCountries(),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(const Right([StubEntities.armenia, StubEntities.usa])),
  );

  return mockRepository;
}

CountryRepository createMockedFailureCountryRepository() {
  final mockRepository = MockCountryRepository();

  when(
    mockRepository.createCountries(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.readCountries(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  return mockRepository;
}
