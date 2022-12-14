import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';

import '../../domain/core/stub_entities.dart';
import '../core/stub_responses.dart';

import 'package:test/test.dart';

void testExchangeRateToJson() {
  final model = createExchangeRateModel();

  expect(
    StubResponses.getEncodedJson(model.toJson()),
    StubResponses.getEncodedJson(StubResponses.dramToDollar),
  );
}

void testExchangeRateFromJson() {
  final model = createExchangeRateModelFromJson();

  expect(model, createExchangeRateModel());
}

ExchangeRateModel createExchangeRateModel() =>
    ExchangeRateModel.fromEntity(StubEntities.dramToDollar);

ExchangeRateModel createExchangeRateModelFromJson() =>
    ExchangeRateModel.fromJson(StubResponses.dramToDollar);
