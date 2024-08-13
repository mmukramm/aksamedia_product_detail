import 'package:flutter/material.dart';

class AppSize {
  static double getDeviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
