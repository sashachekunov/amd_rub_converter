// Mocks generated by Mockito 5.3.2 from annotations
// in amd_rub_converter/test/domain/repositories/exchange_rate_repository.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart'
    as _i6;
import 'package:amd_rub_converter/domain/entities/failure.dart' as _i5;
import 'package:amd_rub_converter/domain/entities/organization_entity.dart'
    as _i7;
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ExchangeRateRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExchangeRateRepository extends _i1.Mock
    implements _i3.ExchangeRateRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> isExchangeRateValid(
          int? timestamp) =>
      (super.noSuchMethod(
        Invocation.method(
          #isExchangeRateValid,
          [timestamp],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #isExchangeRateValid,
            [timestamp],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #isExchangeRateValid,
            [timestamp],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, double>> convertCurrency(
    double? amount,
    _i6.ExchangeRateEntity? exchangeRate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #convertCurrency,
          [
            amount,
            exchangeRate,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, double>>.value(
            _FakeEither_0<_i5.Failure, double>(
          this,
          Invocation.method(
            #convertCurrency,
            [
              amount,
              exchangeRate,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, double>>.value(
                _FakeEither_0<_i5.Failure, double>(
          this,
          Invocation.method(
            #convertCurrency,
            [
              amount,
              exchangeRate,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, double>>);
  @override
  _i4.Future<
      _i2.Either<_i5.Failure,
          _i6.ExchangeRateEntity>> readExchangeRateAMDRUB() =>
      (super.noSuchMethod(
        Invocation.method(
          #readExchangeRateAMDRUB,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ExchangeRateEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ExchangeRateEntity>(
          this,
          Invocation.method(
            #readExchangeRateAMDRUB,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ExchangeRateEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ExchangeRateEntity>(
          this,
          Invocation.method(
            #readExchangeRateAMDRUB,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ExchangeRateEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> updateExchangeRateAMDRUB({
    required double? rate,
    required int? timestamp,
    required List<_i7.OrganizationEntity>? organizations,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateExchangeRateAMDRUB,
          [],
          {
            #rate: rate,
            #timestamp: timestamp,
            #organizations: organizations,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #updateExchangeRateAMDRUB,
            [],
            {
              #rate: rate,
              #timestamp: timestamp,
              #organizations: organizations,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #updateExchangeRateAMDRUB,
            [],
            {
              #rate: rate,
              #timestamp: timestamp,
              #organizations: organizations,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}