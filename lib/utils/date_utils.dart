import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../resources/color_resources.dart';
import 'log_utils.dart';

String datePickerDateFormat = "dd/MM/yyyy";

getTimeDifference(String startDate, String endDate) {
  DateTime tempDate = DateFormat("dd-MM-yyyy HH:MM:SS").parse(startDate);
  DateTime tempDate1 = DateFormat("dd-MM-yyyy HH:MM:SS").parse(endDate);

  final diff_hr = tempDate1.difference(tempDate).inHours;
  return diff_hr;
}

changeDateFormat({required DateTime date, required String changDateFormat}) {
  return DateFormat(changDateFormat).format(date);
}

openDatePickerDialogView(DateTime? selectedDate, {selected}) async {
  final DateTime? picked = await showDatePicker(
    context: Get.context!,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: appMainColor, // Header background color
          colorScheme: ColorScheme.light(primary: appMainColor), // Other colors
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary), // Button theme
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    selected(picked);
    showLogs("DATE", "$picked");
  }
}
