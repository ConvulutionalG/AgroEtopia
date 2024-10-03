import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double textFieldBorderRadius = 8;
double textFieldBorderWidth = 1.2;
double dropDownBorderWidth = 1;
double textFieldHeight = 45;
EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 2);
EdgeInsets maxLineContentPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 10);

List<TextInputFormatter> allowOnlyDoubleDigits = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
  // To allow only one decimal point
  TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.contains('.') &&
        newValue.text.indexOf('.') != newValue.text.lastIndexOf('.')) {
      return oldValue;
    }
    return newValue;
  }),
];
