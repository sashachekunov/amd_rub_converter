import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';

import 'package:dartz/dartz.dart';

class CreateCurrencies extends UseCase<CurrencyRepository, void, NoParams> {
  const CreateCurrencies(super.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.createCurrencies();
}
