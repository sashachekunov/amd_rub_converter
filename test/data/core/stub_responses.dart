import 'dart:convert';

class StubResponses {
  const StubResponses._();

  static const armenia = <String, dynamic>{
    'id': 0,
    'name': 'Armenia',
    'flag': '🇦🇲',
  };

  static const usa = <String, dynamic>{
    'id': 0,
    'name': 'USA',
    'flag': '🇺🇸',
  };

  static const armenianDram = <String, dynamic>{
    'id': 0,
    'code': 'AMD',
    'symbol': '֏',
    'users': [armenia],
  };

  static const unitedStatesDollar = <String, dynamic>{
    'id': 0,
    'code': 'USD',
    'symbol': '\$',
    'users': [usa],
  };

  static const organization = <String, dynamic>{
    'id': 0,
    'name': 'bank',
    'image': '/image.jpg',
  };

  static const dramToDollar = <String, dynamic>{
    'id': 0,
    'from': armenianDram,
    'to': unitedStatesDollar,
    'rate': 0.0025,
    'timestamp': 1668941823,
    'organizations': [organization],
  };

  static const dollarToDram = <String, dynamic>{
    'id': 0,
    'from': unitedStatesDollar,
    'to': armenianDram,
    'rate': 395.18,
    'timestamp': 1668941823,
    'organizations': [organization],
  };

  static String getEncodedJson(Map<String, dynamic> value) =>
      json.encode(value);
}
