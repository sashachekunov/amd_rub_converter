// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExchangeRateModel _$$_ExchangeRateModelFromJson(Map<String, dynamic> json) =>
    _$_ExchangeRateModel(
      id: json['id'] as int? ?? 0,
      from: CurrencyModel.fromJson(json['from'] as Map<String, dynamic>),
      to: CurrencyModel.fromJson(json['to'] as Map<String, dynamic>),
      rate: (json['rate'] as num).toDouble(),
      timestamp: json['timestamp'] as int,
      organizations: (json['organizations'] as List<dynamic>)
          .map((e) => OrganizationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExchangeRateModelToJson(
        _$_ExchangeRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'rate': instance.rate,
      'timestamp': instance.timestamp,
      'organizations': instance.organizations,
    };
