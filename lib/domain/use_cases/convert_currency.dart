import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class ConvertCurrencyParams {
  final double amount;
  final ExchangeRateEntity exchangeRate;

  const ConvertCurrencyParams(this.amount, this.exchangeRate);
}

class ConvertCurrency
    extends UseCase<ExchangeRateRepository, double, ConvertCurrencyParams> {
  const ConvertCurrency(super.repository);

  @override
  Future<Either<Failure, double>> call(ConvertCurrencyParams params) async =>
      await repository.convertCurrency(params.amount, params.exchangeRate);
}
