import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/domain/entities/failure.dart';

import 'package:dartz/dartz.dart';

abstract class RepositoryImpl {
  const RepositoryImpl();

  Future<Either<Failure, T>> handleDataSourceRequest<T>(
      Future<T> Function() request) async {
    try {
      return Right(await request());
    } on NetworkException {
      return const Left(Failure(FailureType.network));
    } on ServerException {
      return const Left(Failure(FailureType.api));
    } on UnauthorisedException {
      return const Left(Failure(FailureType.unauthorised));
    } on ResponseException {
      return const Left(Failure(FailureType.response));
    } on DataBaseException {
      return const Left(Failure(FailureType.database));
    } catch (e) {
      return const Left(Failure(FailureType.unknown));
    }
  }
}
