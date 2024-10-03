import 'dart:async';

import 'package:crop_yield/resources/image_resources.dart';
import 'package:crop_yield/ui/auth/controller/auth_controller.dart';
import 'package:crop_yield/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../constants/routes_constants.dart';
import '../../resources/color_resources.dart';
import '../../utils/navigateUtils.dart';
import '../../utils/shared_preference_data.dart';
import '../../widgets/set_custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    SharedPreferenceData.initializedSharedPreference();

    Timer(Duration(seconds: 3), () async {
      // AuthController.to.addLoginData(data: AuthController.to.loginData);
      var userID = await SharedPreferenceData.getStringData(
          SharedPreferenceData.sharedUserId);
      var userRole = await SharedPreferenceData.getStringData(
          SharedPreferenceData.sharedUserType);
      print("USER ID====>>>>$userID");
      if (userID!.isEmpty) {
        // navigateToWithRoutClearBack(Routes.loginRoute, context);
        navigateToWithRoutClearBack(Routes.knowAboutRoute, context);
      } else {
        navigateToWithRoutClearBack(Routes.landRequestFarmerRoute, context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUtils.changeStatusBarColor();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: SetCustomImageView(
            imageUrl: app_icon,
            isNetworkImage: false,
          )),
        ),
      ),
    );
  }
}
