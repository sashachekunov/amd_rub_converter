import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/repositories/app_repository.dart';
import 'package:amd_rub_converter/data/data_sources/app_local_data_source.dart';
import 'package:amd_rub_converter/data/repositories/repository_impl.dart';

import 'package:dartz/dartz.dart';

class AppRepositoryImpl extends RepositoryImpl implements AppRepository {
  final AppLocalDataSource _dataSource;

  const AppRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, bool>> isFirstLaunch() =>
      handleDataSourceRequest(_dataSource.readFirstLaunch);

  @override
  Future<Either<Failure, void>> writeFirstLaunch() =>
      handleDataSourceRequest(_dataSource.writeFirstLaunch);
}
