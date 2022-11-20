import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';

import '../core/stub_entities.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateNiceMocks([MockSpec<CurrencyRepository>()])
import 'currency_repository.mocks.dart';

CurrencyRepository createMockedCurrencyRepository() {
  final mockRepository = MockCurrencyRepository();

  when(
    mockRepository.createCurrencies(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(null)),
  );

  when(
    mockRepository.readCurrencies(),
  ).thenAnswer(
    (realInvocation) => Future.value(
      const Right([StubEntities.armenianDram, StubEntities.unitedStatesDollar]),
    ),
  );

  return mockRepository;
}

CurrencyRepository createMockedFailureCurrencyRepository() {
  final mockRepository = MockCurrencyRepository();

  when(
    mockRepository.createCurrencies(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.readCurrencies(),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  return mockRepository;
}
