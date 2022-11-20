import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';

import 'package:dartz/dartz.dart';

class IsExchangeRateValid extends UseCase<ExchangeRateRepository, bool, int> {
  const IsExchangeRateValid(super.repository);

  @override
  Future<Either<Failure, bool>> call(int params) async =>
      await repository.isExchangeRateValid(params);
}
