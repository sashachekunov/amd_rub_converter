import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/country_repository.dart';

import 'package:dartz/dartz.dart';

class CreateCountries extends UseCase<CountryRepository, void, NoParams> {
  const CreateCountries(super.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.createCountries();
}
