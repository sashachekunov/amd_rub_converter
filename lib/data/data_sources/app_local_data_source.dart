import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/db_constants.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/presentation/core/local_notifications.dart';

abstract class AppLocalDataSource {
  const AppLocalDataSource();

  Future<bool> readFirstLaunch();
  Future<void> writeFirstLaunch();
  Future<void> scheduleNotification(int timestamp);
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final DBClient _client;
  final LocalNotifications _localNotifications;

  const AppLocalDataSourceImpl(this._client, this._localNotifications);

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
      _client.write(DBConstants.firstLaunchKey, 'not_first_launch');

  @override
  Future<void> scheduleNotification(int timestamp) async =>
      _localNotifications.scheduleNotification(timestamp);
}
