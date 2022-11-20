import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/currency_entity.dart';

import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, void>> createCurrencies();
  Future<Either<Failure, List<CurrencyEntity>>> readCurrencies();
}
