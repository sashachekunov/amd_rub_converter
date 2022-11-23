import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class UpdateExchangeRateAMDRUBParams {
  final bool cashless;
  final ExchangeRateEntity exchangeRate;

  const UpdateExchangeRateAMDRUBParams(this.cashless, this.exchangeRate);
}

class UpdateExchangeRateAMDRUB extends UseCase<ExchangeRateRepository, void,
    UpdateExchangeRateAMDRUBParams> {
  const UpdateExchangeRateAMDRUB(super.repository);

  @override
  Future<Either<Failure, void>> call(
          UpdateExchangeRateAMDRUBParams params) async =>
      await repository.updateExchangeRateAMDRUB(
        cashless: params.cashless,
        rate: params.exchangeRate.rate,
        timestamp: params.exchangeRate.timestamp,
        organizations: params.exchangeRate.organizations,
      );
}
