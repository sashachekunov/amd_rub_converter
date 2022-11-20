// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrencyEntity {
  String get code => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  List<CountryEntity> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyEntityCopyWith<CurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyEntityCopyWith<$Res> {
  factory $CurrencyEntityCopyWith(
          CurrencyEntity value, $Res Function(CurrencyEntity) then) =
      _$CurrencyEntityCopyWithImpl<$Res, CurrencyEntity>;
  @useResult
  $Res call({String code, String symbol, List<CountryEntity> users});
}

/// @nodoc
class _$CurrencyEntityCopyWithImpl<$Res, $Val extends CurrencyEntity>
    implements $CurrencyEntityCopyWith<$Res> {
  _$CurrencyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CountryEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyEntityCopyWith<$Res>
    implements $CurrencyEntityCopyWith<$Res> {
  factory _$$_CurrencyEntityCopyWith(
          _$_CurrencyEntity value, $Res Function(_$_CurrencyEntity) then) =
      __$$_CurrencyEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String symbol, List<CountryEntity> users});
}

/// @nodoc
class __$$_CurrencyEntityCopyWithImpl<$Res>
    extends _$CurrencyEntityCopyWithImpl<$Res, _$_CurrencyEntity>
    implements _$$_CurrencyEntityCopyWith<$Res> {
  __$$_CurrencyEntityCopyWithImpl(
      _$_CurrencyEntity _value, $Res Function(_$_CurrencyEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? users = null,
  }) {
    return _then(_$_CurrencyEntity(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CountryEntity>,
    ));
  }
}

/// @nodoc

class _$_CurrencyEntity implements _CurrencyEntity {
  const _$_CurrencyEntity(
      {required this.code,
      required this.symbol,
      required final List<CountryEntity> users})
      : _users = users;

  @override
  final String code;
  @override
  final String symbol;
  final List<CountryEntity> _users;
  @override
  List<CountryEntity> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'CurrencyEntity(code: $code, symbol: $symbol, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyEntity &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, symbol, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyEntityCopyWith<_$_CurrencyEntity> get copyWith =>
      __$$_CurrencyEntityCopyWithImpl<_$_CurrencyEntity>(this, _$identity);
}

abstract class _CurrencyEntity implements CurrencyEntity {
  const factory _CurrencyEntity(
      {required final String code,
      required final String symbol,
      required final List<CountryEntity> users}) = _$_CurrencyEntity;

  @override
  String get code;
  @override
  String get symbol;
  @override
  List<CountryEntity> get users;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyEntityCopyWith<_$_CurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
