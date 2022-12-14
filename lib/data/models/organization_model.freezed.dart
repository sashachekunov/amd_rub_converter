// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_OrganizationModelCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$_OrganizationModelCopyWith(_$_OrganizationModel value,
          $Res Function(_$_OrganizationModel) then) =
      __$$_OrganizationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class __$$_OrganizationModelCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$_OrganizationModel>
    implements _$$_OrganizationModelCopyWith<$Res> {
  __$$_OrganizationModelCopyWithImpl(
      _$_OrganizationModel _value, $Res Function(_$_OrganizationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$_OrganizationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
@JsonSerializable()
class _$_OrganizationModel extends _OrganizationModel {
  const _$_OrganizationModel(
      {this.id = 0, required this.name, required this.image})
      : super._();

  factory _$_OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'OrganizationModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      __$$_OrganizationModelCopyWithImpl<_$_OrganizationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizationModelToJson(
      this,
    );
  }
}

abstract class _OrganizationModel extends OrganizationModel {
  const factory _OrganizationModel(
      {final int id,
      required final String name,
      required final String image}) = _$_OrganizationModel;
  const _OrganizationModel._() : super._();

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganizationModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
