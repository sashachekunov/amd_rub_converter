import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/currency_entity.dart';
import 'package:amd_rub_converter/domain/repositories/currency_repository.dart';
import 'package:amd_rub_converter/data/data_sources/currency_local_data_source.dart';
import 'package:amd_rub_converter/data/repositories/repository_impl.dart';

import 'package:dartz/dartz.dart';

class CurrencyRepositoryImpl extends RepositoryImpl
    implements CurrencyRepository {
  final CurrencyLocalDataSource _dataSource;

  const CurrencyRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> createCurrencies() =>
      handleDataSourceRequest(_dataSource.createCurrencies);

  @override
  Future<Either<Failure, List<CurrencyEntity>>> readCurrencies() =>
      handleDataSourceRequest(() async => (await _dataSource.readCurrencies())
          .map((e) => e.fromModel())
          .toList());
}
