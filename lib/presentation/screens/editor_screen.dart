import 'package:amd_rub_converter/presentation/core/url_launcher.dart';
import 'package:amd_rub_converter/presentation/core/app_typography.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_cubit.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_state.dart';
import 'package:amd_rub_converter/presentation/widgets/exchange_rate_input_form.dart';
import 'package:amd_rub_converter/presentation/screens/loading_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditorBuilder extends StatelessWidget {
  final ConverterState state;

  const EditorBuilder(this.state, {super.key});

  @override
  Widget build(BuildContext context) =>
      state.cashExchangeRate == null || state.cashlessExchangeRate == null
          ? const LoadingScreen()
          : EditorScreen(
              cashExchangeRate: state.cashExchangeRate!,
              cashlessExchangeRate: state.cashlessExchangeRate!,
              organizations: state.organizations,
              updateExchangeRates: (cashExchangeRate, cashlessExchangeRate) {
                BlocProvider.of<ConverterCubit>(context).updateExchangeRates(
                    cashExchangeRate, cashlessExchangeRate);
                Navigator.pop(context);
              },
            );
}

class EditorScreen extends StatefulWidget {
  final ExchangeRateEntity cashExchangeRate;
  final ExchangeRateEntity cashlessExchangeRate;
  final List<OrganizationEntity> organizations;
  final void Function(ExchangeRateEntity, ExchangeRateEntity)
      updateExchangeRates;

  const EditorScreen({
    super.key,
    required this.cashExchangeRate,
    required this.cashlessExchangeRate,
    required this.organizations,
    required this.updateExchangeRates,
  });

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late double cashRate;
  late double cashlessRate;
  late List<OrganizationEntity> cashOrganizations;
  late List<OrganizationEntity> cashlessOrganizations;

  @override
  void initState() {
    cashRate = widget.cashExchangeRate.rate == 0
        ? 0
        : 1 / widget.cashExchangeRate.rate;
    cashlessRate = widget.cashlessExchangeRate.rate == 0
        ? 0
        : 1 / widget.cashlessExchangeRate.rate;
    cashOrganizations = widget.cashExchangeRate.organizations;
    cashlessOrganizations = widget.cashlessExchangeRate.organizations;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text('Редактор', style: AppTypography.h3),
        ),
        backgroundColor: Colors.amber[50],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () =>
                      UrlLauncher.launchUrl('https://t.me/armeniaCurrency'),
                  child: const Text(
                    'Актуальные курсы',
                    style: AppTypography.body2Link,
                  ),
                ),
                _buildDivider(),
                ExchangeRateInputForm(
                  header: 'Наличный курс',
                  exchangeRate: widget.cashExchangeRate,
                  organizations: widget.organizations,
                  onSelectOrganization: (value) =>
                      setState(() => cashOrganizations = [value]),
                  onTypeRate: (rate) => setState(() => cashRate = rate),
                ),
                _buildDivider(),
                ExchangeRateInputForm(
                  header: 'Безналичный курс',
                  exchangeRate: widget.cashlessExchangeRate,
                  organizations: widget.organizations,
                  onSelectOrganization: (value) =>
                      setState(() => cashlessOrganizations = [value]),
                  onTypeRate: (rate) => setState(() => cashlessRate = rate),
                ),
                _buildDivider(),
                _buildAcceptButton(),
              ],
            ),
          ),
        ),
      );

  bool get _validateInput => cashRate <= 0 || cashlessRate <= 0;

  TextButton _buildAcceptButton() => TextButton(
        onPressed: () {
          if (_validateInput) return;

          widget.updateExchangeRates(
            widget.cashExchangeRate.copyWith(
              rate: cashRate == 0 ? 0 : 1 / cashRate,
              organizations: cashOrganizations.isEmpty
                  ? [widget.organizations.first]
                  : cashOrganizations,
            ),
            widget.cashlessExchangeRate.copyWith(
              rate: cashlessRate == 0 ? 0 : 1 / cashlessRate,
              organizations: cashlessOrganizations.isEmpty
                  ? [widget.organizations.first]
                  : cashlessOrganizations,
            ),
          );
        },
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.yellow[200],
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            'Сохранить',
            style: AppTypography.button.copyWith(color: Colors.black),
          ),
        ),
      );

  Divider _buildDivider([double height = 25]) =>
      Divider(color: Colors.transparent, height: height);
}
