import 'package:crop_yield/utils/shared_preference_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/color_resources.dart';

class WidgetUtils {
  static Decoration setDecoration({Color? color, double? borderRadius}) {
    return BoxDecoration(
      color: color ?? appMainColor,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
    );
  }

  static Decoration setBorderDecoration(
      {Color? color, double? borderRadius, double? borderWidth}) {
    return BoxDecoration(
      border: Border.all(color: color ?? appMainColor, width: borderWidth ?? 1),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
    );
  }

  static showLogoutIcon() {
    return [
      IconButton(
        icon: Icon(
          Icons.logout,
          color: color_044F68,
        ),
        onPressed: () {
          // Handle logout logic here
          print('Logout tapped');
          showLogoutPopup();
        },
      ),
    ];
  }

  static void showLogoutPopup() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                SharedPreferenceData.cleanAllSharedPreference();
              },
            ),
          ],
        );
      },
    );
  }
}
