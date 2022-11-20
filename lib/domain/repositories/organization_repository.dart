import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';

import 'package:dartz/dartz.dart';

abstract class OrganizationRepository {
  Future<Either<Failure, void>> createOrganizations();
  Future<Either<Failure, List<OrganizationEntity>>> readOrganizations();
}
