import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
  ),
).apply(
  bodyColor: primaryColor900,
  displayColor: primaryColor900,
);
