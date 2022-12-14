import 'package:amd_rub_converter/data/models/country_model.dart';

import '../../domain/core/stub_entities.dart';
import '../core/stub_responses.dart';

import 'package:test/test.dart';

void testCountryToJson() {
  final model = createCountryModel();

  expect(
    StubResponses.getEncodedJson(model.toJson()),
    StubResponses.getEncodedJson(StubResponses.armenia),
  );
}

void testCountryFromJson() {
  final model = createCountryModelFromJson();

  expect(model, createCountryModel());
}

CountryModel createCountryModel() =>
    CountryModel.fromEntity(StubEntities.armenia);

CountryModel createCountryModelFromJson() =>
    CountryModel.fromJson(StubResponses.armenia);
