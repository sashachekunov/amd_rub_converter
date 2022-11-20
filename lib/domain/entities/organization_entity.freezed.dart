// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'organization_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrganizationEntity {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizationEntityCopyWith<OrganizationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationEntityCopyWith<$Res> {
  factory $OrganizationEntityCopyWith(
          OrganizationEntity value, $Res Function(OrganizationEntity) then) =
      _$OrganizationEntityCopyWithImpl<$Res, OrganizationEntity>;
  @useResult
  $Res call({String name, String image});
}

/// @nodoc
class _$OrganizationEntityCopyWithImpl<$Res, $Val extends OrganizationEntity>
    implements $OrganizationEntityCopyWith<$Res> {
  _$OrganizationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganizationEntityCopyWith<$Res>
    implements $OrganizationEntityCopyWith<$Res> {
  factory _$$_OrganizationEntityCopyWith(_$_OrganizationEntity value,
          $Res Function(_$_OrganizationEntity) then) =
      __$$_OrganizationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String image});
}

/// @nodoc
class __$$_OrganizationEntityCopyWithImpl<$Res>
    extends _$OrganizationEntityCopyWithImpl<$Res, _$_OrganizationEntity>
    implements _$$_OrganizationEntityCopyWith<$Res> {
  __$$_OrganizationEntityCopyWithImpl(
      _$_OrganizationEntity _value, $Res Function(_$_OrganizationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$_OrganizationEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrganizationEntity implements _OrganizationEntity {
  const _$_OrganizationEntity({required this.name, required this.image});

  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'OrganizationEntity(name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationEntityCopyWith<_$_OrganizationEntity> get copyWith =>
      __$$_OrganizationEntityCopyWithImpl<_$_OrganizationEntity>(
          this, _$identity);
}

abstract class _OrganizationEntity implements OrganizationEntity {
  const factory _OrganizationEntity(
      {required final String name,
      required final String image}) = _$_OrganizationEntity;

  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationEntityCopyWith<_$_OrganizationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
