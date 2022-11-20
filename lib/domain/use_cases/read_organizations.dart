import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class ReadOrganizations extends UseCase<OrganizationRepository,
    List<OrganizationEntity>, NoParams> {
  const ReadOrganizations(super.repository);

  @override
  Future<Either<Failure, List<OrganizationEntity>>> call(
          NoParams params) async =>
      await repository.readOrganizations();
}
