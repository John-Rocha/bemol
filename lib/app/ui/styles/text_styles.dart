import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';

  TextStyle get textPrimaryFontRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
      );

  TextStyle get labelTextFields => textPrimaryFontRegular.copyWith(
        color: ColorsApp.instance.greyDark,
      );

  TextStyle get textPrimaryFontMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );
  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: primaryFont,
      );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        color: Colors.white,
        fontSize: 22,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 22,
      );

  TextStyle get titlePrimatyColor => textPrimaryFontBold.copyWith(
        color: ColorsApp.instance.primary,
        fontSize: 22,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
