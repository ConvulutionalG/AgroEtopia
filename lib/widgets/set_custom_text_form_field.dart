import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resources/color_resources.dart';
import '../../resources/style_resources.dart';

class SetCustomTextFormField extends StatelessWidget {
  final double fontSize;
  final double borderSide;
  final String hintText;
  final String lblText;
  final Color hintTextColor;
  final Color textColor;
  final Color fillColor;
  final Color textfiledborderlinecolor;
  final FontWeight hintWeight;
  final FontWeight textWeight;
  final TextEditingController controller;
  final int maxLines;
  final TextInputAction textInputAction;
  final FocusScopeNode focusScopeNode;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool readOnly;
  final BuildContext context;
  final TextAlign textAlign;
  final FontStyle? fontStyle;
  final int? maxLength;
  final IconButton? rightIconButton;
  final IconButton? leftIconButton;
  final double? prefixIconWidth;
  double? verticalPadding;
  final dynamic onTap;
  final dynamic onChagedText;
  final dynamic onFieldSubmitted;

  SetCustomTextFormField({
    required this.fontSize,
    required this.borderSide,
    required this.hintText,
    required this.lblText,
    required this.hintTextColor,
    required this.textColor,
    required this.fillColor,
    required this.textfiledborderlinecolor,
    required this.hintWeight,
    required this.textWeight,
    required this.controller,
    required this.maxLines,
    required this.textInputAction,
    required this.focusScopeNode,
    required this.textInputType,
    required this.obscureText,
    required this.readOnly,
    required this.context,
    required this.textAlign,
    this.fontStyle,
    this.maxLength,
    this.rightIconButton,
    this.leftIconButton,
    this.prefixIconWidth,
    this.verticalPadding,
    this.onTap,
    this.focusNode,
    this.inputFormatters,
    this.onChagedText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return createTextFormFieldWithOutBoarder();
  }

  Widget createTextFormFieldWithOutBoarder() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lblText.isNotEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: Text(
                    lblText,
                    style: heading1TextStyle(
                      size: fontSize,
                      fontWeight: FontWeight.w500,
                      colors: Colors.black,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          TextFormField(
              toolbarOptions: ToolbarOptions(
                copy: false,
                cut: false,
                paste: false,
                selectAll: false,
              ),
              autocorrect: true,
              obscureText: obscureText,
              controller: controller,
              maxLines: maxLines,
              readOnly: readOnly,
              textAlign: textAlign,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              // style: showTextWithStyle(
              //     fontWeight: textWeight,
              //     size: fontSize,
              //     colors: textColor,
              //     context: context),
              style: TextStyle(
                  fontWeight: textWeight, fontSize: fontSize, color: textColor),
              onTap: onTap,
              onChanged: (text) {
                if (onChagedText != null) {
                  onChagedText(text);
                }
              },
              onFieldSubmitted: (String value) {
                if (onFieldSubmitted != null) {
                  onFieldSubmitted();
                }
              },
              focusNode: focusNode ?? null,
              maxLength: maxLength,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: fillColor,
                  constraints: maxLines == 8 ? null : BoxConstraints(
                    maxHeight: 40,
                    minHeight: 40
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical:12,
                      horizontal:
                          rightIconButton == null && leftIconButton == null
                              ? 20
                              : leftIconButton == null
                                  ? 20
                                  : 10.0),
                  suffixIcon: rightIconButton != null
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: rightIconButton)
                      : null,
                  prefixIcon: leftIconButton != null
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(start: 5.0),
                          child: leftIconButton)
                      : null,
                  enabled: true,
                  prefixIconConstraints: prefixIconWidth != null
                      ? BoxConstraints(minWidth: prefixIconWidth!)
                      : null,
                  hintStyle: TextStyle(
                      fontWeight: hintWeight,
                      fontSize: fontSize,
                      color: hintTextColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: textfiledborderlinecolor, width: 0.0),
                    borderRadius: BorderRadius.circular(borderSide),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: textfiledborderlinecolor, width: 0.0),
                    borderRadius: BorderRadius.circular(borderSide),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: textfiledborderlinecolor, width: 0.0),
                    borderRadius: BorderRadius.circular(borderSide),
                  ),
                  hintText: hintText),
              onEditingComplete: () => focusScopeNode.nextFocus())
        ],
      ),
    );
  }
}
