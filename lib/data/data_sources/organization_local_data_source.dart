import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';

abstract class OrganizationLocalDataSource {
  const OrganizationLocalDataSource();

  Future<void> createOrganizations();
  Future<List<OrganizationModel>> readOrganizations();
}

class OrganizationLocalDataSourceImpl implements OrganizationLocalDataSource {
  final DBClient _client;

  const OrganizationLocalDataSourceImpl(this._client);

  @override
  Future<void> createOrganizations() async {
    final organizations =
        DBConstants.organizations.map((e) => e.toJson()).toList();

    _client.write(DBConstants.organizationsKey, organizations);
  }

  @override
  Future<List<OrganizationModel>> readOrganizations() async {
    final response = await _client.read(DBConstants.organizationsKey);

    try {
      return (response as Iterable)
          .map((e) => OrganizationModel.fromJson(e))
          .toList();
    } catch (e) {
      throw const ResponseException();
    }
  }
}
