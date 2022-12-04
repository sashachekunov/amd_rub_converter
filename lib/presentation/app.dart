import 'package:amd_rub_converter/di/di.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_cubit.dart';
import 'package:amd_rub_converter/presentation/core/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ConverterCubit>(create: (_) => di.converterCubit),
        ],
        child: MaterialApp.router(
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
