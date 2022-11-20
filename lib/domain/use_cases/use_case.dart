import 'package:amd_rub_converter/domain/entities/failure.dart';

import 'package:dartz/dartz.dart';

abstract class UseCase<Repository, Type, Params> {
  final Repository repository;

  const UseCase(this.repository);

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
