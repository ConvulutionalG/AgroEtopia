import 'package:crop_yield/resources/color_resources.dart';
import 'package:crop_yield/resources/style_resources.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/ui/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constants.dart';
import '../../../utils/navigateUtils.dart';
import '../../../widgets/AppBarView.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarView(),
        body: GetBuilder<AuthController>(builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.appIconView(),
                    SizedBox(height: 20),
                    Text(
                      'Thank You!',
                      style: heading4TextStyle(
                          colors: color_044F68, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your submission was successful.',
                      textAlign: TextAlign.center,
                      style: heading6TextStyle(
                          colors: color_044F68, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 40),
                  ],
                )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // primary: Colors.blue, // Change to your desired color
                      backgroundColor: btn_color),
                  onPressed: () {
                    navigateToWithRoutClearBack(
                        Routes.landRequestFarmerRoute, context);
                    // Get.back(); // Navigate back to the previous screen
                  },
                  child: Text(
                    'Go Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        }));
  }
}
