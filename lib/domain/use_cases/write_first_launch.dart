import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/app_repository.dart';

import 'package:dartz/dartz.dart';

class WriteFirstLaunch extends UseCase<AppRepository, void, NoParams> {
  const WriteFirstLaunch(super.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.writeFirstLaunch();
}
