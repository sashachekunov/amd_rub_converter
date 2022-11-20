// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exchange_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExchangeRateModel _$ExchangeRateModelFromJson(Map<String, dynamic> json) {
  return _ExchangeRateModel.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRateModel {
  int get id => throw _privateConstructorUsedError;
  CurrencyModel get from => throw _privateConstructorUsedError;
  CurrencyModel get to => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  List<OrganizationModel> get organizations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeRateModelCopyWith<ExchangeRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateModelCopyWith<$Res> {
  factory $ExchangeRateModelCopyWith(
          ExchangeRateModel value, $Res Function(ExchangeRateModel) then) =
      _$ExchangeRateModelCopyWithImpl<$Res, ExchangeRateModel>;
  @useResult
  $Res call(
      {int id,
      CurrencyModel from,
      CurrencyModel to,
      double rate,
      int timestamp,
      List<OrganizationModel> organizations});

  $CurrencyModelCopyWith<$Res> get from;
  $CurrencyModelCopyWith<$Res> get to;
}

/// @nodoc
class _$ExchangeRateModelCopyWithImpl<$Res, $Val extends ExchangeRateModel>
    implements $ExchangeRateModelCopyWith<$Res> {
  _$ExchangeRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? timestamp = null,
    Object? organizations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
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
              as List<OrganizationModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyModelCopyWith<$Res> get from {
    return $CurrencyModelCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyModelCopyWith<$Res> get to {
    return $CurrencyModelCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExchangeRateModelCopyWith<$Res>
    implements $ExchangeRateModelCopyWith<$Res> {
  factory _$$_ExchangeRateModelCopyWith(_$_ExchangeRateModel value,
          $Res Function(_$_ExchangeRateModel) then) =
      __$$_ExchangeRateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CurrencyModel from,
      CurrencyModel to,
      double rate,
      int timestamp,
      List<OrganizationModel> organizations});

  @override
  $CurrencyModelCopyWith<$Res> get from;
  @override
  $CurrencyModelCopyWith<$Res> get to;
}

/// @nodoc
class __$$_ExchangeRateModelCopyWithImpl<$Res>
    extends _$ExchangeRateModelCopyWithImpl<$Res, _$_ExchangeRateModel>
    implements _$$_ExchangeRateModelCopyWith<$Res> {
  __$$_ExchangeRateModelCopyWithImpl(
      _$_ExchangeRateModel _value, $Res Function(_$_ExchangeRateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? timestamp = null,
    Object? organizations = null,
  }) {
    return _then(_$_ExchangeRateModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
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
              as List<OrganizationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExchangeRateModel implements _ExchangeRateModel {
  const _$_ExchangeRateModel(
      {this.id = 0,
      required this.from,
      required this.to,
      required this.rate,
      required this.timestamp,
      required final List<OrganizationModel> organizations})
      : _organizations = organizations;

  factory _$_ExchangeRateModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExchangeRateModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final CurrencyModel from;
  @override
  final CurrencyModel to;
  @override
  final double rate;
  @override
  final int timestamp;
  final List<OrganizationModel> _organizations;
  @override
  List<OrganizationModel> get organizations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  @override
  String toString() {
    return 'ExchangeRateModel(id: $id, from: $from, to: $to, rate: $rate, timestamp: $timestamp, organizations: $organizations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExchangeRateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._organizations, _organizations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, from, to, rate, timestamp,
      const DeepCollectionEquality().hash(_organizations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExchangeRateModelCopyWith<_$_ExchangeRateModel> get copyWith =>
      __$$_ExchangeRateModelCopyWithImpl<_$_ExchangeRateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExchangeRateModelToJson(
      this,
    );
  }
}

abstract class _ExchangeRateModel implements ExchangeRateModel {
  const factory _ExchangeRateModel(
          {final int id,
          required final CurrencyModel from,
          required final CurrencyModel to,
          required final double rate,
          required final int timestamp,
          required final List<OrganizationModel> organizations}) =
      _$_ExchangeRateModel;

  factory _ExchangeRateModel.fromJson(Map<String, dynamic> json) =
      _$_ExchangeRateModel.fromJson;

  @override
  int get id;
  @override
  CurrencyModel get from;
  @override
  CurrencyModel get to;
  @override
  double get rate;
  @override
  int get timestamp;
  @override
  List<OrganizationModel> get organizations;
  @override
  @JsonKey(ignore: true)
  _$$_ExchangeRateModelCopyWith<_$_ExchangeRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
