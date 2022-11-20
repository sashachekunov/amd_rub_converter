import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/repositories/organization_repository.dart';

import 'package:dartz/dartz.dart';

class CreateOrganizations
    extends UseCase<OrganizationRepository, void, NoParams> {
  const CreateOrganizations(super.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.createOrganizations();
}
