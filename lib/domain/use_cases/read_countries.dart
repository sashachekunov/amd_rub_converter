import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/country_entity.dart';
import 'package:amd_rub_converter/domain/repositories/country_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class ReadCountries
    extends UseCase<CountryRepository, List<CountryEntity>, NoParams> {
  const ReadCountries(super.repository);

  @override
  Future<Either<Failure, List<CountryEntity>>> call(NoParams params) async =>
      await repository.readCountries();
}
