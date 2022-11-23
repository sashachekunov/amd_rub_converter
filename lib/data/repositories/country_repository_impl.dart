import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/country_entity.dart';
import 'package:amd_rub_converter/domain/repositories/country_repository.dart';
import 'package:amd_rub_converter/data/data_sources/country_local_data_source.dart';
import 'package:amd_rub_converter/data/repositories/repository_impl.dart';
import 'package:amd_rub_converter/data/mappers/country_mapper.dart';

import 'package:dartz/dartz.dart';

class CountryRepositoryImpl extends RepositoryImpl
    implements CountryRepository {
  final CountryLocalDataSource _dataSource;

  const CountryRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> createCountries() =>
      handleDataSourceRequest(_dataSource.createCountries);

  @override
  Future<Either<Failure, List<CountryEntity>>> readCountries() =>
      handleDataSourceRequest(() async => (await _dataSource.readCountries())
          .map((e) => CountryMapper.fromModel(e))
          .toList());
}
