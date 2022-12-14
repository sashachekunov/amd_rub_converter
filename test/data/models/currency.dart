import 'package:amd_rub_converter/data/models/currency_model.dart';

import '../../domain/core/stub_entities.dart';
import '../core/stub_responses.dart';

import 'package:test/test.dart';

void testCurrencyToJson() {
  final model = createCurrencyModel();

  expect(
    StubResponses.getEncodedJson(model.toJson()),
    StubResponses.getEncodedJson(StubResponses.armenianDram),
  );
}

void testCurrencyFromJson() {
  final model = createCurrencyModelFromJson();

  expect(model, createCurrencyModel());
}

CurrencyModel createCurrencyModel() =>
    CurrencyModel.fromEntity(StubEntities.armenianDram);

CurrencyModel createCurrencyModelFromJson() =>
    CurrencyModel.fromJson(StubResponses.armenianDram);
