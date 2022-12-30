import 'package:amd_rub_converter/di/di.dart';
import 'package:amd_rub_converter/presentation/core/app_theme.dart';
import 'package:amd_rub_converter/presentation/bloc/global_bloc_observer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'dart:async';

abstract class App extends StatelessWidget {
  const App({super.key});

  void initAndRun() async => await _init().whenComplete(_run);

  Future<void> _init() async {
    _ensureWidgetsInitialized();
    _setupBlocObserver();
    await _initAppComponents();
  }

  void _ensureWidgetsInitialized() => WidgetsFlutterBinding.ensureInitialized();

  void _setupBlocObserver() => Bloc.observer = GlobalBlocObserver();

  Future<void> _initAppComponents() async => await di.init();

  void _run() => runZoned<void>(
        () => runApp(this),
        zoneSpecification: ZoneSpecification(print: _print),
      );

  void _print(Zone self, ZoneDelegate parent, Zone zone, String message) {
    if (!kReleaseMode) parent.print(zone, "Intercepted: $message");
  }
}

class AMDRUBConverter extends App {
  const AMDRUBConverter({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => di.converterCubit..initConverterState(),
        child: MaterialApp.router(
          title: 'Конвертер ֏₽',
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('ru', 'RU')],
          locale: const Locale('ru', 'RU'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.theme,
          themeMode: ThemeMode.light,
          routeInformationProvider: di.routeInformationProvider,
          routeInformationParser: di.routeInformationParser,
          routerDelegate: di.routerDelegate,
          backButtonDispatcher: di.backButtonDispatcher,
        ),
      );
}
