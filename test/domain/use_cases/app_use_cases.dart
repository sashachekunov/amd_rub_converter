import 'package:amd_rub_converter/domain/use_cases/use_case.dart';
import 'package:amd_rub_converter/domain/use_cases/is_first_launch.dart';
import 'package:amd_rub_converter/domain/use_cases/write_first_launch.dart';
import 'package:amd_rub_converter/domain/repositories/app_repository.dart';

import '../core/stub_entities.dart';

import 'package:test/test.dart';

void testIsFirstLaunch(AppRepository repository) async {
  final isFirstLaunch = IsFirstLaunch(repository);

  final isFirstLaunchOrFailure = await isFirstLaunch(const NoParams());

  isFirstLaunchOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (firstLaunch) => expect(firstLaunch, true),
  );
}

void testWriteFirstLaunch(AppRepository repository) async {
  final writeFirstLaunch = WriteFirstLaunch(repository);

  final voidOrFailure = await writeFirstLaunch(const NoParams());

  voidOrFailure.fold(
    (failure) => expect(failure, StubEntities.failure),
    (result) => result,
  );
}
