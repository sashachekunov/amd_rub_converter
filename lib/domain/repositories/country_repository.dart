import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/country_entity.dart';

import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Failure, void>> createCountries();
  Future<Either<Failure, List<CountryEntity>>> readCountries();
}
