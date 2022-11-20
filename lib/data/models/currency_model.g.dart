// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyModel _$$_CurrencyModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyModel(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String,
      symbol: json['symbol'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CurrencyModelToJson(_$_CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'symbol': instance.symbol,
      'users': instance.users,
    };
