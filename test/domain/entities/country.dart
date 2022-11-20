import 'package:amd_rub_converter/domain/entities/country_entity.dart';

import 'package:test/test.dart';

void testCountryConstructor() {
  final armenia = createCountryEntity();

  expect(armenia.getFieldsString(), 'Armenia🇦🇲');
}

void testCountryCopyWithMethod() {
  final usa = createCountryEntity().copyWith(name: 'USA', flag: '🇺🇸');

  expect(usa.getFieldsString(), 'USA🇺🇸');
}

void testCountryEquality() {
  final armenia = createCountryEntity();
  final usa = createCountryEntity().copyWith(name: 'USA', flag: '🇺🇸');

  expect(armenia == usa, false);
}

CountryEntity createCountryEntity() =>
    const CountryEntity(name: 'Armenia', flag: '🇦🇲');

extension Stringification on CountryEntity {
  String getFieldsString() => '$name' '$flag';
}
