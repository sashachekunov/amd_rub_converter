import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_cubit.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_state.dart';
import 'package:amd_rub_converter/presentation/screens/converter_screen.dart';
import 'package:amd_rub_converter/presentation/screens/editor_screen.dart';
import 'package:amd_rub_converter/presentation/screens/error_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ScreenBuilder extends StatelessWidget {
  const ScreenBuilder(this._navigationState, {Key? key}) : super(key: key);

  final NavigationState? _navigationState;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ConverterCubit, ConverterState>(
        builder: (context, state) => GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Builder(builder: (context) {
            if (_navigationState is CurrencyConverter) {
              return ConverterBuilder(state);
            } else if (_navigationState is ExchangeRateEditor) {
              return EditorBuilder(state);
            }

            return const ErrorScreen();
          }),
        ),
      );
}
