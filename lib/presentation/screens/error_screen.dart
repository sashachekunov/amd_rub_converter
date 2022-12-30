import 'package:amd_rub_converter/presentation/core/app_typography.dart';
import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text('Ошибка', style: AppTypography.h3),
        ),
        backgroundColor: Colors.amber[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                'Перейти в конвертер',
                () => Router.of(context)
                    .routerDelegate
                    .setNewRoutePath(const CurrencyConverter()),
              ),
              _buildButton(
                'Перейти в редактор',
                () => Router.of(context)
                    .routerDelegate
                    .setNewRoutePath(const ExchangeRateEditor()),
              ),
            ],
          ),
        ),
      );

  TextButton _buildButton(String text, VoidCallback onPressed) => TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTypography.button.copyWith(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      );
}
