import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class ReadExchangeRateAMDRUB
    extends UseCase<ExchangeRateRepository, ExchangeRateEntity, NoParams> {
  const ReadExchangeRateAMDRUB(super.repository);

  @override
  Future<Either<Failure, ExchangeRateEntity>> call(NoParams params) async =>
      repository.readExchangeRateAMDRUB();
}
