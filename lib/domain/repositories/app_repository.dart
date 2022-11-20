import 'package:amd_rub_converter/domain/entities/failure.dart';

import 'package:dartz/dartz.dart';

abstract class AppRepository {
  Future<Either<Failure, bool>> isFirstLaunch();
  Future<Either<Failure, void>> writeFirstLaunch();
}
