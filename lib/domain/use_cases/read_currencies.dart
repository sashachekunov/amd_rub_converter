import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class ReadCurrencies
    extends UseCase<CurrencyRepository, List<CurrencyEntity>, NoParams> {
  const ReadCurrencies(super.repository);

  @override
  Future<Either<Failure, List<CurrencyEntity>>> call(NoParams params) async =>
      await repository.readCurrencies();
}
