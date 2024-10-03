import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_resources.dart';

const String fontFamilyMontserrat = "Montserrat";

final ThemeData myThemeData = ThemeData(
  fontFamily: fontFamilyMontserrat,
  scaffoldBackgroundColor: backgroundColor,
  // backgroundColor: backgroundColor,
  primaryColor: appMainColor,
  primaryColorLight: secondaryBackgroundColor,
  disabledColor: disabledColor,
  dividerColor: secondaryBackgroundColor,

  ///app bar theme
  appBarTheme: const AppBarTheme(color: Colors.black, elevation: 0),

  ///text theme
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: appMainColor, fontFamily: fontFamilyMontserrat),
    // bodyLarge: heading1TextStyle()
  ),
);

TextStyle? heading1TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 28,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading2TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 26,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading3TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
  FontStyle? fontStyle
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 24,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading4TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 22,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading5TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 20,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading6TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 0.50,
      height: 1.5,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 18,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle? heading7TextStyle({
  bool? isShowUnderLine,
  double? size,
  Color? colors,
  Color? underLineColor,
  FontWeight? fontWeight,
}) {
  return Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
      letterSpacing: 1.2,
      height: 1.3,
      fontFamily: fontFamilyMontserrat,
      fontSize: size ?? 14,
      fontWeight: fontWeight,
      decorationColor: underLineColor ?? null,
      decoration: isShowUnderLine == true ? TextDecoration.underline : null,
      color: colors);
}

TextStyle errorStyle() {
  return TextStyle(color: Colors.red, fontSize: 12);
}

TextStyle? hintStyle() {
  return heading7TextStyle(colors: color_044F68, fontWeight: FontWeight.w400);
}

TextStyle? textStyle() {
  return heading6TextStyle(colors: color_044F68, fontWeight: FontWeight.w500,size: 14);
}
