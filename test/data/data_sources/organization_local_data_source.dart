import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/data_sources/organization_local_data_source.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

void testReadOrganizations(SharedPreferences preferences) async {
  final dataSource = OrganizationLocalDataSourceImpl(DBClient(preferences));

  try {
    expect(await dataSource.readOrganizations(), DBConstants.organizations);
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testCreateOrganizations(SharedPreferences preferences) async {
  final dataSource = OrganizationLocalDataSourceImpl(DBClient(preferences));

  try {
    await dataSource.createOrganizations();
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}
