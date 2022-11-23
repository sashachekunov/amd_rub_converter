import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';
import 'package:amd_rub_converter/data/data_sources/organization_local_data_source.dart';
import 'package:amd_rub_converter/data/repositories/repository_impl.dart';
import 'package:amd_rub_converter/data/mappers/organization_mapper.dart';

import 'package:dartz/dartz.dart';

class OrganizationRepositoryImpl extends RepositoryImpl
    implements OrganizationRepository {
  final OrganizationLocalDataSource _dataSource;

  const OrganizationRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> createOrganizations() =>
      handleDataSourceRequest(_dataSource.createOrganizations);

  @override
  Future<Either<Failure, List<OrganizationEntity>>> readOrganizations() =>
      handleDataSourceRequest(() async =>
          (await _dataSource.readOrganizations())
              .map((e) => OrganizationMapper.fromModel(e))
              .toList());
}
