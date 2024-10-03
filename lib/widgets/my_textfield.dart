import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/AppConstants.dart';
import '../resources/style_resources.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  Widget? prefixIcon, suffixIcon;
  String hintText;
  FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  bool obscureText;
  GlobalKey<FormState>? formKey;
  double? borderWidth, borderRadius;
  Color? borderColor;
  TextStyle? hintTextStyle, textStyle;
  bool readOnly;
  EdgeInsets? margin;
  dynamic? onTap;
  int? maxLine;
  int? maxLength;
  String? Function(String?)? validator;

  MyTextField(
      {required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.focusNode,
      required this.textInputAction,
      required this.textInputType,
      this.inputFormatters,
      this.borderWidth,
      this.borderRadius,
      this.borderColor,
      this.hintTextStyle,
      this.textStyle,
      this.onTap,
      this.margin,
      this.formKey,
      this.maxLine,
      this.readOnly = false,
      this.obscureText = false,
      this.maxLength,
      this.validator,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    if (validator == null) {
      return showTextField();
    }
    return FormField<String>(
        initialValue: '',
        validator: validator, // Add validator here
        builder: (FormFieldState<String> state) {
          // print(
          //     "VALIDATio===>>>${validator}         SS==>>${state.hasError}      TEXT==>>${controller.text}");
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showTextField(state: state),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 12),
                    child: Text(state.errorText!, style: errorStyle()),
                  ),
              ]);
        });
  }

  showTextField({FormFieldState<String>? state}) {
    return Container(
      height: maxLine != null ? null : textFieldHeight,
      margin: margin ?? EdgeInsets.only(bottom: 20),
      alignment: Alignment.centerLeft,
      child: Center(
        child: TextFormField(
            toolbarOptions: ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),
            controller: controller,
            obscureText: obscureText,
            style: textStyle,
            readOnly: readOnly,
            maxLength: maxLength,
            onTap: onTap,
            onChanged: (value) {
              if (state != null) {
                state.didChange(value);
              }
            },
            // validator: validator,
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hintText,
                contentPadding: maxLine != null
                    ? maxLine! > 1
                        ? maxLineContentPadding
                        : contentPadding
                    : contentPadding,
                errorStyle: errorStyle(),
                hintStyle:
                    hintTextStyle ?? TextStyle(color: Colors.grey.shade400),
                fillColor: borderColor ?? Colors.black,
                focusColor: borderColor ?? Colors.black,
                hoverColor: borderColor ?? Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black,
                      width: borderWidth ?? textFieldBorderWidth),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? textFieldBorderRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black,
                      width: borderWidth ?? textFieldBorderWidth),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? textFieldBorderRadius),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black,
                      width: borderWidth ?? textFieldBorderWidth),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? textFieldBorderRadius),
                ),
                counterText: ''),
            textInputAction: textInputAction,
            maxLines: maxLine ?? 1,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
            onEditingComplete: () => focusNode.nextFocus()),
      ),
    );
  }
}
