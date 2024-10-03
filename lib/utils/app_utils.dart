import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../resources/color_resources.dart';

class AppUtils {
  static changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icon color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  static validEmailID(String emailId) {
    // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailId);
    bool emailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailId);
    return emailValid;
  }

  static showToast(String message) {
    closeKeyboard(Get.context!);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 1,
        // backgroundColor: appBtnPinkColor,
        backgroundColor: appMainColor,
        textColor: Colors.white,
        fontSize: Platform.isIOS ? 15 : 13);
  }

  static closeKeyboard(BuildContext context) {
    if (Platform.isAndroid) {
      FocusScope.of(context).unfocus();
    }
  }

  static Future<void> showProgressDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
              child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
                color: appMainColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: CircularProgressIndicator(color: Colors.white),
          ));
        });
  }

  static hideProgressDialog(BuildContext context) {
    closeKeyboard(context);
    Navigator.pop(context, false);
  }
}
