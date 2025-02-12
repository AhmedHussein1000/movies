import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleRegular18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleMedium18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
      );
 static TextStyle styleSemiBold18
(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleMedium20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleSemiBold24(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w600,
      );
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  return width / 412;
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSize = fontSize * getScaleFactor(context);
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
