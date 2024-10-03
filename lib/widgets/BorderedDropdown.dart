import 'package:flutter/material.dart';

import '../constants/AppConstants.dart';
import '../resources/color_resources.dart';
import '../resources/style_resources.dart';

class BorderedDropdown extends StatelessWidget {
  String hintText, value;
  List<String> list;
  dynamic onSelectedDropdown;
  GlobalKey<FormState>? formKey;
  String? Function(String?)? validator;

  BorderedDropdown(
      {required this.hintText,
      required this.value,
      required this.list,
      required this.onSelectedDropdown,
      this.validator,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      // initialValue: '',
      validator: validator, // Add validator here
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: textFieldHeight,
              padding: contentPadding,
              decoration: BoxDecoration(
                border:
                    Border.all(color: color_3d7ebd, width: dropDownBorderWidth),
                // Set the border color
                borderRadius: BorderRadius.circular(
                  0.0,
                ), // Set the border radius
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value.isNotEmpty ? value : null,
                  hint: Text(
                    hintText,
                    style: hintStyle(),
                  ),
                  dropdownColor: Colors.white,
                  style: textStyle(),
                  // Initial value
                  icon: Icon(Icons.arrow_drop_down, color: color_044F68),
                  // Dropdown arrow icon
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:heading7TextStyle(colors: color_044F68, fontWeight: FontWeight.w500,size: 14)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle change here
                    state.didChange(newValue);
                    onSelectedDropdown(newValue);
                  },
                ),
              ),
            ),
            // Show validation error if exists
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 12),
                child: Text(state.errorText!, style: errorStyle()),
              ),
          ],
        );
      },
    );
  }
}
