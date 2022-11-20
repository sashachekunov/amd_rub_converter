import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class UpdateExchangeRateAMDRUB
    extends UseCase<ExchangeRateRepository, void, ExchangeRateEntity> {
  const UpdateExchangeRateAMDRUB(super.repository);

  @override
  Future<Either<Failure, void>> call(ExchangeRateEntity params) async =>
      await repository.updateExchangeRateAMDRUB(
        rate: params.rate,
        timestamp: params.timestamp,
        organizations: params.organizations,
      );
}
