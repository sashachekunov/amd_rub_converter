import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';

import 'package:dartz/dartz.dart';

abstract class ExchangeRateRepository {
  Future<Either<Failure, bool>> isExchangeRateValid(int timestamp);
  Future<Either<Failure, double>> convertCurrency(
    double amount,
    ExchangeRateEntity exchangeRate,
  );

  Future<Either<Failure, ExchangeRateEntity>> readExchangeRateAMDRUB();
  Future<Either<Failure, void>> updateExchangeRateAMDRUB({
    required double rate,
    required int timestamp,
    required List<OrganizationEntity> organizations,
  });
}
