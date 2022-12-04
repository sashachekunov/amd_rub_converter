import 'package:amd_rub_converter/di/di.dart';
import 'package:amd_rub_converter/presentation/app.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
