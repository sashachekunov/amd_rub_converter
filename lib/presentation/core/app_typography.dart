import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  /// Font family
  static const regularFontFamily = 'NotoSans-Regular';
  static const mediumFontFamily = 'NotoSans-Medium';
  static const boldFontFamily = 'NotoSans-Bold';
  static const semiBoldFontFamily = 'NotoSans-SemiBold';

  /// Header
  static const h0 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 64,
  );
  static const h1 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 40,
  );
  static const h2 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 28,
  );
  static const h3 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 22,
  );
  static const h4 = TextStyle(
    fontFamily: semiBoldFontFamily,
    fontSize: 20,
  );
  static const h5 = TextStyle(
    fontFamily: semiBoldFontFamily,
    fontSize: 18,
  );

  /// Button
  static const button = TextStyle(
    fontFamily: mediumFontFamily,
    fontSize: 18,
  );

  /// Body
  static const body0 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 40,
  );
  static const body1 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 16,
  );
  static const body2 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 14,
  );
  static const body2Link = TextStyle(
    fontFamily: mediumFontFamily,
    fontSize: 14,
  );
  static const body3 = TextStyle(
    fontFamily: mediumFontFamily,
    fontSize: 14,
  );

  /// Caption
  static const caption1 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 13,
  );
  static const caption2 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 12,
  );
  static const caption3 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 10,
  );
  static const caption4 = TextStyle(
    fontFamily: mediumFontFamily,
    fontSize: 10,
  );
}
