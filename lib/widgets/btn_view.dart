import 'package:crop_yield/resources/color_resources.dart';
import 'package:crop_yield/widgets/myInkWell.dart';
import 'package:flutter/material.dart';

import '../resources/style_resources.dart';
import '../utils/widget_utils.dart';

class BtnView extends StatelessWidget {
  String text;
  Color? bgColor, txtColor;
  double? width, borderRadius;
  EdgeInsets? padding;
  dynamic? onTap;

  BtnView(
      {required this.text,
      this.bgColor,
      this.txtColor,
      this.width,
      this.onTap,
      this.borderRadius,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return myInkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? appMainColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50)),
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: heading5TextStyle(
              colors: txtColor ?? Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
