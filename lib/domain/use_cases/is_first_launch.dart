import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/app_repository.dart';

import 'package:dartz/dartz.dart';

class IsFirstLaunch extends UseCase<AppRepository, bool, NoParams> {
  const IsFirstLaunch(super.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async =>
      await repository.isFirstLaunch();
}
