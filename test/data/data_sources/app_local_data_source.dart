import 'package:amd_rub_converter/data/core/db_client.dart';
import 'package:amd_rub_converter/data/core/exceptions.dart';
import 'package:amd_rub_converter/data/data_sources/app_local_data_source.dart';
import 'package:amd_rub_converter/presentation/core/local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/expect.dart';

void testReadFirstLaunch(SharedPreferences preferences) async {
  final dataSource = AppLocalDataSourceImpl(DBClient(preferences),
      LocalNotifications(FlutterLocalNotificationsPlugin()));

  try {
    expect(await dataSource.readFirstLaunch(), true);
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}

void testWriteFirstLaunch(SharedPreferences preferences) async {
  final dataSource = AppLocalDataSourceImpl(DBClient(preferences),
      LocalNotifications(FlutterLocalNotificationsPlugin()));

  try {
    await dataSource.writeFirstLaunch();
  } catch (e) {
    expect(e.runtimeType, DataBaseException);
  }
}
