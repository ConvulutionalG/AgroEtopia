import 'dart:async';
import 'dart:convert';

import 'package:crop_yield/ui/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/routes_constants.dart';
import 'log_utils.dart';
import 'navigateUtils.dart';

SharedPreferences? prefs;

class SharedPreferenceData {
  //Primary form keys
  static String sharedUserId = "sharedUserId";
  static String sharedUserName = "sharedUserName";
  static String sharedUserType = "sharedUserType";

  static initializedSharedPreference() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  static storeStringData(String key, String value) async {
    if (prefs != null) {
      prefs!.setString(key, value);
    }
  }

  static Future<String?> getStringData(String key) async {
    if (prefs != null) {
      if (prefs!.containsKey(key)) {
        return prefs!.getString(key);
      }
    }
    return "";
  }

  static changeMapToEncoded(Map<String, String> mapData) {
    return jsonEncode(mapData);
  }

  static getJsonData(String value) {
    showLogs("getJsonData", "${jsonDecode(value)}");
    return jsonDecode(value);
  }

  static cleanAllSharedPreference() {
    if (prefs != null) {
      prefs!.clear();
      AuthController.to.clear();
      navigateToWithRoutClearBack(Routes.loginRoute, Get.context!);
    }
  }
}
