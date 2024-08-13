import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: primaryColor500,
    textTheme: textTheme.apply(bodyColor: primaryColor900),
    scaffoldBackgroundColor: scaffoldColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor500,
      secondary: secondaryColor500,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor900, foregroundColor: Colors.white),
    ),
  );
}
