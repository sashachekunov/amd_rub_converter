// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exchange_rate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExchangeRateEntity {
  CurrencyEntity get from => throw _privateConstructorUsedError;
  CurrencyEntity get to => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  List<OrganizationEntity> get organizations =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExchangeRateEntityCopyWith<ExchangeRateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateEntityCopyWith<$Res> {
  factory $ExchangeRateEntityCopyWith(
          ExchangeRateEntity value, $Res Function(ExchangeRateEntity) then) =
      _$ExchangeRateEntityCopyWithImpl<$Res, ExchangeRateEntity>;
  @useResult
  $Res call(
      {CurrencyEntity from,
      CurrencyEntity to,
      double rate,
      int timestamp,
      List<OrganizationEntity> organizations});

  $CurrencyEntityCopyWith<$Res> get from;
  $CurrencyEntityCopyWith<$Res> get to;
}

/// @nodoc
class _$ExchangeRateEntityCopyWithImpl<$Res, $Val extends ExchangeRateEntity>
    implements $ExchangeRateEntityCopyWith<$Res> {
  _$ExchangeRateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? timestamp = null,
    Object? organizations = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CurrencyEntity,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CurrencyEntity,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      organizations: null == organizations
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<OrganizationEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyEntityCopyWith<$Res> get from {
    return $CurrencyEntityCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyEntityCopyWith<$Res> get to {
    return $CurrencyEntityCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExchangeRateEntityCopyWith<$Res>
    implements $ExchangeRateEntityCopyWith<$Res> {
  factory _$$_ExchangeRateEntityCopyWith(_$_ExchangeRateEntity value,
          $Res Function(_$_ExchangeRateEntity) then) =
      __$$_ExchangeRateEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyEntity from,
      CurrencyEntity to,
      double rate,
      int timestamp,
      List<OrganizationEntity> organizations});

  @override
  $CurrencyEntityCopyWith<$Res> get from;
  @override
  $CurrencyEntityCopyWith<$Res> get to;
}

/// @nodoc
class __$$_ExchangeRateEntityCopyWithImpl<$Res>
    extends _$ExchangeRateEntityCopyWithImpl<$Res, _$_ExchangeRateEntity>
    implements _$$_ExchangeRateEntityCopyWith<$Res> {
  __$$_ExchangeRateEntityCopyWithImpl(
      _$_ExchangeRateEntity _value, $Res Function(_$_ExchangeRateEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? timestamp = null,
    Object? organizations = null,
  }) {
    return _then(_$_ExchangeRateEntity(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CurrencyEntity,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CurrencyEntity,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      organizations: null == organizations
          ? _value._organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<OrganizationEntity>,
    ));
  }
}

/// @nodoc

class _$_ExchangeRateEntity extends _ExchangeRateEntity {
  const _$_ExchangeRateEntity(
      {required this.from,
      required this.to,
      required this.rate,
      required this.timestamp,
      required final List<OrganizationEntity> organizations})
      : _organizations = organizations,
        super._();

  @override
  final CurrencyEntity from;
  @override
  final CurrencyEntity to;
  @override
  final double rate;
  @override
  final int timestamp;
  final List<OrganizationEntity> _organizations;
  @override
  List<OrganizationEntity> get organizations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  @override
  String toString() {
    return 'ExchangeRateEntity(from: $from, to: $to, rate: $rate, timestamp: $timestamp, organizations: $organizations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExchangeRateEntity &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._organizations, _organizations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, rate, timestamp,
      const DeepCollectionEquality().hash(_organizations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExchangeRateEntityCopyWith<_$_ExchangeRateEntity> get copyWith =>
      __$$_ExchangeRateEntityCopyWithImpl<_$_ExchangeRateEntity>(
          this, _$identity);
}

abstract class _ExchangeRateEntity extends ExchangeRateEntity {
  const factory _ExchangeRateEntity(
          {required final CurrencyEntity from,
          required final CurrencyEntity to,
          required final double rate,
          required final int timestamp,
          required final List<OrganizationEntity> organizations}) =
      _$_ExchangeRateEntity;
  const _ExchangeRateEntity._() : super._();

  @override
  CurrencyEntity get from;
  @override
  CurrencyEntity get to;
  @override
  double get rate;
  @override
  int get timestamp;
  @override
  List<OrganizationEntity> get organizations;
  @override
  @JsonKey(ignore: true)
  _$$_ExchangeRateEntityCopyWith<_$_ExchangeRateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
