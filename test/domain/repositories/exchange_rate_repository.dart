import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';

import '../core/stub_entities.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateNiceMocks([MockSpec<ExchangeRateRepository>()])
import 'exchange_rate_repository.mocks.dart';

ExchangeRateRepository createMockedExchangeRateRepository() {
  final mockRepository = MockExchangeRateRepository();

  when(
    mockRepository.isExchangeRateValid(0),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(false)),
  );

  when(
    mockRepository.convertCurrency(10000, StubEntities.dramToDollar),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(25)),
  );

  when(
    mockRepository.readExchangeRateAMDRUB(true),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(StubEntities.dramToDollar)),
  );

  when(
    mockRepository.updateExchangeRateAMDRUB(
      cashless: true,
      rate: 0.1001,
      timestamp: 1,
      organizations: [],
    ),
  ).thenAnswer(
    (realInvocation) => Future.value(const Right(null)),
  );

  return mockRepository;
}

ExchangeRateRepository createMockedFailureExchangeRateRepository() {
  final mockRepository = MockExchangeRateRepository();

  when(
    mockRepository.isExchangeRateValid(0),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.convertCurrency(10000, StubEntities.dramToDollar),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.readExchangeRateAMDRUB(true),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  when(
    mockRepository.updateExchangeRateAMDRUB(
      cashless: true,
      rate: 0.1001,
      timestamp: 1,
      organizations: [],
    ),
  ).thenAnswer(
    (realInvocation) => Future.value(const Left(StubEntities.failure)),
  );

  return mockRepository;
}
