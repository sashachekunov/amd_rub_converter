// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConverterState {
  ExchangeRateEntity? get cashExchangeRate =>
      throw _privateConstructorUsedError;
  ExchangeRateEntity? get cashlessExchangeRate =>
      throw _privateConstructorUsedError;
  List<OrganizationEntity> get organizations =>
      throw _privateConstructorUsedError;
  bool get cashless => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConverterStateCopyWith<ConverterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConverterStateCopyWith<$Res> {
  factory $ConverterStateCopyWith(
          ConverterState value, $Res Function(ConverterState) then) =
      _$ConverterStateCopyWithImpl<$Res, ConverterState>;
  @useResult
  $Res call(
      {ExchangeRateEntity? cashExchangeRate,
      ExchangeRateEntity? cashlessExchangeRate,
      List<OrganizationEntity> organizations,
      bool cashless});

  $ExchangeRateEntityCopyWith<$Res>? get cashExchangeRate;
  $ExchangeRateEntityCopyWith<$Res>? get cashlessExchangeRate;
}

/// @nodoc
class _$ConverterStateCopyWithImpl<$Res, $Val extends ConverterState>
    implements $ConverterStateCopyWith<$Res> {
  _$ConverterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashExchangeRate = freezed,
    Object? cashlessExchangeRate = freezed,
    Object? organizations = null,
    Object? cashless = null,
  }) {
    return _then(_value.copyWith(
      cashExchangeRate: freezed == cashExchangeRate
          ? _value.cashExchangeRate
          : cashExchangeRate // ignore: cast_nullable_to_non_nullable
              as ExchangeRateEntity?,
      cashlessExchangeRate: freezed == cashlessExchangeRate
          ? _value.cashlessExchangeRate
          : cashlessExchangeRate // ignore: cast_nullable_to_non_nullable
              as ExchangeRateEntity?,
      organizations: null == organizations
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<OrganizationEntity>,
      cashless: null == cashless
          ? _value.cashless
          : cashless // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExchangeRateEntityCopyWith<$Res>? get cashExchangeRate {
    if (_value.cashExchangeRate == null) {
      return null;
    }

    return $ExchangeRateEntityCopyWith<$Res>(_value.cashExchangeRate!, (value) {
      return _then(_value.copyWith(cashExchangeRate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExchangeRateEntityCopyWith<$Res>? get cashlessExchangeRate {
    if (_value.cashlessExchangeRate == null) {
      return null;
    }

    return $ExchangeRateEntityCopyWith<$Res>(_value.cashlessExchangeRate!,
        (value) {
      return _then(_value.copyWith(cashlessExchangeRate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConverterStateCopyWith<$Res>
    implements $ConverterStateCopyWith<$Res> {
  factory _$$_ConverterStateCopyWith(
          _$_ConverterState value, $Res Function(_$_ConverterState) then) =
      __$$_ConverterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExchangeRateEntity? cashExchangeRate,
      ExchangeRateEntity? cashlessExchangeRate,
      List<OrganizationEntity> organizations,
      bool cashless});

  @override
  $ExchangeRateEntityCopyWith<$Res>? get cashExchangeRate;
  @override
  $ExchangeRateEntityCopyWith<$Res>? get cashlessExchangeRate;
}

/// @nodoc
class __$$_ConverterStateCopyWithImpl<$Res>
    extends _$ConverterStateCopyWithImpl<$Res, _$_ConverterState>
    implements _$$_ConverterStateCopyWith<$Res> {
  __$$_ConverterStateCopyWithImpl(
      _$_ConverterState _value, $Res Function(_$_ConverterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashExchangeRate = freezed,
    Object? cashlessExchangeRate = freezed,
    Object? organizations = null,
    Object? cashless = null,
  }) {
    return _then(_$_ConverterState(
      cashExchangeRate: freezed == cashExchangeRate
          ? _value.cashExchangeRate
          : cashExchangeRate // ignore: cast_nullable_to_non_nullable
              as ExchangeRateEntity?,
      cashlessExchangeRate: freezed == cashlessExchangeRate
          ? _value.cashlessExchangeRate
          : cashlessExchangeRate // ignore: cast_nullable_to_non_nullable
              as ExchangeRateEntity?,
      organizations: null == organizations
          ? _value._organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<OrganizationEntity>,
      cashless: null == cashless
          ? _value.cashless
          : cashless // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConverterState extends _ConverterState {
  const _$_ConverterState(
      {this.cashExchangeRate,
      this.cashlessExchangeRate,
      final List<OrganizationEntity> organizations = const [],
      this.cashless = true})
      : _organizations = organizations,
        super._();

  @override
  final ExchangeRateEntity? cashExchangeRate;
  @override
  final ExchangeRateEntity? cashlessExchangeRate;
  final List<OrganizationEntity> _organizations;
  @override
  @JsonKey()
  List<OrganizationEntity> get organizations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  @override
  @JsonKey()
  final bool cashless;

  @override
  String toString() {
    return 'ConverterState(cashExchangeRate: $cashExchangeRate, cashlessExchangeRate: $cashlessExchangeRate, organizations: $organizations, cashless: $cashless)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConverterState &&
            (identical(other.cashExchangeRate, cashExchangeRate) ||
                other.cashExchangeRate == cashExchangeRate) &&
            (identical(other.cashlessExchangeRate, cashlessExchangeRate) ||
                other.cashlessExchangeRate == cashlessExchangeRate) &&
            const DeepCollectionEquality()
                .equals(other._organizations, _organizations) &&
            (identical(other.cashless, cashless) ||
                other.cashless == cashless));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cashExchangeRate,
      cashlessExchangeRate,
      const DeepCollectionEquality().hash(_organizations),
      cashless);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConverterStateCopyWith<_$_ConverterState> get copyWith =>
      __$$_ConverterStateCopyWithImpl<_$_ConverterState>(this, _$identity);
}

abstract class _ConverterState extends ConverterState {
  const factory _ConverterState(
      {final ExchangeRateEntity? cashExchangeRate,
      final ExchangeRateEntity? cashlessExchangeRate,
      final List<OrganizationEntity> organizations,
      final bool cashless}) = _$_ConverterState;
  const _ConverterState._() : super._();

  @override
  ExchangeRateEntity? get cashExchangeRate;
  @override
  ExchangeRateEntity? get cashlessExchangeRate;
  @override
  List<OrganizationEntity> get organizations;
  @override
  bool get cashless;
  @override
  @JsonKey(ignore: true)
  _$$_ConverterStateCopyWith<_$_ConverterState> get copyWith =>
      throw _privateConstructorUsedError;
}
