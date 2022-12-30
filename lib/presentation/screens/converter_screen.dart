import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_cubit.dart';
import 'package:amd_rub_converter/presentation/bloc/converter/converter_state.dart';
import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:amd_rub_converter/presentation/screens/loading_screen.dart';
import 'package:amd_rub_converter/presentation/widgets/content_card.dart';
import 'package:amd_rub_converter/presentation/core/app_typography.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConverterBuilder extends StatelessWidget {
  final ConverterState state;

  const ConverterBuilder(this.state, {super.key});

  @override
  Widget build(BuildContext context) => state.exchangeRate == null
      ? const LoadingScreen()
      : ConverterScreen(
          cashless: state.cashless,
          exchangeRate: state.exchangeRate!,
          openEditor: () => Router.of(context)
              .routerDelegate
              .setNewRoutePath(const ExchangeRateEditor()),
          switchCashlessMode:
              BlocProvider.of<ConverterCubit>(context).switchCashlessMode,
          convert: (amount) async =>
              await BlocProvider.of<ConverterCubit>(context).convert(amount),
        );
}

class ConverterScreen extends StatefulWidget {
  final bool cashless;
  final ExchangeRateEntity exchangeRate;

  final VoidCallback openEditor;
  final VoidCallback switchCashlessMode;
  final Future<double> Function(double) convert;

  const ConverterScreen({
    super.key,
    required this.cashless,
    required this.exchangeRate,
    required this.openEditor,
    required this.switchCashlessMode,
    required this.convert,
  });

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final _textController = TextEditingController();
  double converterResult = 0;

  @override
  void initState() {
    _textController.addListener(_textFieldListener);

    super.initState();
  }

  @override
  void dispose() {
    _textController
      ..removeListener(_textFieldListener)
      ..dispose();

    super.dispose();
  }

  void _textFieldListener() async {
    if (_textController.text.isNotEmpty) {
      final result =
          await widget.convert(double.tryParse(_textController.text) ?? 0);
      setState(() => converterResult = result);
    } else {
      setState(() => converterResult = 0);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.amber[50],
        appBar: _buildAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildExchangeRateInfo(),
                _buildDivider(),
                _buildConverter(),
                _buildDivider(),
                _buildHelperChips(),
              ],
            ),
          ),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.amber[50],
        foregroundColor: Colors.black,
        title: Text(
          'Конвертер '
          '${widget.exchangeRate.from.users.first.flag} '
          '${widget.exchangeRate.to.users.first.flag}',
          style: AppTypography.h3,
        ),
        actions: [
          IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              widget.openEditor();
            },
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Редактировать курс',
          ),
          IconButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();
              widget.switchCashlessMode();
              final result = await widget
                  .convert(double.tryParse(_textController.text) ?? 0);
              setState(() => converterResult = result);
            },
            icon: Icon(
              widget.cashless ? Icons.credit_card : Icons.money_rounded,
              size: 26,
            ),
            tooltip: 'Установить '
                '${widget.cashless ? "наличный" : "безналичный"} '
                'курс',
          ),
        ],
      );

  ContentCard _buildExchangeRateInfo() {
    final reverseRate =
        widget.exchangeRate.rate == 0 ? .0 : 1 / widget.exchangeRate.rate;

    return ContentCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '1 ${widget.exchangeRate.to.symbol} = '
              '${reverseRate.toStringAsFixed(2)} ${widget.exchangeRate.from.symbol}',
              style: AppTypography.h5,
            ),
          ),
          if (widget.exchangeRate.organizations.isNotEmpty)
            Image.network(
              widget.exchangeRate.organizations.first.image,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
        ],
      ),
    );
  }

  Divider _buildDivider([double height = 25]) =>
      Divider(color: Colors.transparent, height: height);

  ContentCard _buildConverter() => ContentCard(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 3),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Text(
                    widget.exchangeRate.to.symbol,
                    style: AppTypography.body0,
                  ),
                  Center(
                    child: Text(
                      converterResult == 0
                          ? 'Введите сумму в драмах'
                          : converterResult.toStringAsFixed(2),
                      style: converterResult == 0
                          ? AppTypography.button
                          : AppTypography.h2,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Text(
                  widget.exchangeRate.from.symbol,
                  style: AppTypography.h1,
                ),
                TextField(
                  maxLength: 7,
                  maxLines: 1,
                  style: AppTypography.h2,
                  textAlign: TextAlign.center,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: '0',
                    counterText: '',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _textController,
                ),
              ],
            ),
          ],
        ),
      );

  ContentCard _buildHelperChips() => ContentCard(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildChip(10),
                _buildChip(20),
                _buildChip(50),
                _buildChip(100),
                _buildChip(200),
                _buildChip(500),
              ],
            ),
            _buildDivider(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildChip(
                  1000,
                  label: '1K',
                  shape: const BeveledRectangleBorder(),
                ),
                _buildChip(
                  5000,
                  label: '5K',
                  shape: const BeveledRectangleBorder(),
                ),
                _buildChip(
                  10000,
                  label: '10K',
                  shape: const BeveledRectangleBorder(),
                ),
                _buildChip(
                  20000,
                  label: '20K',
                  shape: const BeveledRectangleBorder(),
                ),
                _buildChip(
                  50000,
                  label: '50K',
                  shape: const BeveledRectangleBorder(),
                ),
              ],
            ),
          ],
        ),
      );

  ActionChip _buildChip(
    int amount, {
    String? label,
    OutlinedBorder shape = const CircleBorder(),
  }) =>
      ActionChip(
        label: Text(label ?? '$amount'),
        tooltip: label?.replaceAll('K', '000'),
        labelStyle: AppTypography.body3,
        onPressed: () {
          FocusScope.of(context).unfocus();
          _textController.text = '$amount';
        },
        backgroundColor: Colors.yellow[200],
        shadowColor: Colors.transparent,
        shape: shape,
        side: const BorderSide(color: Colors.yellow, width: 2),
      );
}
