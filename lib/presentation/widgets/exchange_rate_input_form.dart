import 'package:amd_rub_converter/presentation/core/app_typography.dart';
import 'package:amd_rub_converter/presentation/widgets/content_card.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeRateInputForm extends StatefulWidget {
  final String header;
  final ExchangeRateEntity exchangeRate;
  final List<OrganizationEntity> organizations;
  final void Function(OrganizationEntity) onSelectOrganization;
  final void Function(double) onTypeRate;

  const ExchangeRateInputForm({
    Key? key,
    required this.header,
    required this.exchangeRate,
    required this.organizations,
    required this.onSelectOrganization,
    required this.onTypeRate,
  }) : super(key: key);

  @override
  State<ExchangeRateInputForm> createState() => _ExchangeRateInputFormState();
}

class _ExchangeRateInputFormState extends State<ExchangeRateInputForm> {
  final _controller = TextEditingController();
  OrganizationEntity? selectedOrganization;

  @override
  void initState() {
    _controller.addListener(_textFieldListener);

    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_textFieldListener)
      ..dispose();

    super.dispose();
  }

  void _textFieldListener() =>
      setState(() => widget.onTypeRate(double.tryParse(_controller.text) ?? 0));

  @override
  Widget build(BuildContext context) => ContentCard(
        child: Column(
          children: [
            Text(widget.header, style: AppTypography.h5),
            const Divider(color: Colors.transparent, height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1 ${widget.exchangeRate.to.symbol} = ',
                  style: AppTypography.h5,
                ),
                Flexible(
                  child: TextField(
                    controller: _controller,
                    maxLength: 10,
                    maxLines: 1,
                    style: AppTypography.h5,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: widget.exchangeRate.rate == 0
                          ? '0'
                          : (1 / widget.exchangeRate.rate).toStringAsFixed(2),
                      counterText: '',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                    ],
                  ),
                ),
                Text(
                  widget.exchangeRate.from.symbol,
                  style: AppTypography.h5,
                ),
              ],
            ),
            const Divider(),
            PopupMenuButton<OrganizationEntity>(
              tooltip: 'Выбрать обменник',
              color: Colors.yellow[200],
              initialValue: selectedOrganization,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              itemBuilder: (context) =>
                  widget.organizations.map(_organizationPopupMenuItem).toList(),
              onSelected: (value) {
                setState(() => selectedOrganization = value);
                widget.onSelectOrganization(value);
              },
              child: _buildOrganizationRow(
                selectedOrganization ??
                    (widget.exchangeRate.organizations.isNotEmpty
                        ? widget.exchangeRate.organizations.first
                        : widget.organizations.first),
              ),
            ),
          ],
        ),
      );

  PopupMenuItem<OrganizationEntity> _organizationPopupMenuItem(
          OrganizationEntity organization) =>
      PopupMenuItem<OrganizationEntity>(
          value: organization, child: _buildOrganizationRow(organization));

  Row _buildOrganizationRow(OrganizationEntity organization) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              organization.name,
              style: AppTypography.h5.copyWith(
                color: organization == selectedOrganization ||
                        selectedOrganization == null &&
                            widget.exchangeRate.organizations.isNotEmpty &&
                            organization ==
                                widget.exchangeRate.organizations.first
                    ? Colors.black
                    : Colors.black38,
              ),
            ),
          ),
          Flexible(
            child: Image.network(
              organization.image,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(height: 50, width: 50),
            ),
          ),
        ],
      );
}
