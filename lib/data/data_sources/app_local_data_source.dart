import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';

abstract class AppLocalDataSource {
  const AppLocalDataSource();

  Future<bool> readFirstLaunch();
  Future<void> writeFirstLaunch();
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final DBClient _client;

  const AppLocalDataSourceImpl(this._client);

  @override
  Future<bool> readFirstLaunch() async {
    final response = await _client.read(DBConstants.firstLaunchKey);

    try {
      return (response as String).isEmpty;
    } catch (e) {
      throw const ResponseException();
    }
  }

  @override
  Future<void> writeFirstLaunch() async =>
      await _client.write(DBConstants.firstLaunchKey, 'not_first_launch');
}
