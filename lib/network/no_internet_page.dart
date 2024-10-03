import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/color_resources.dart';

class NoInternetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.signal_wifi_bad,
                color: appMainColor,
                size: 54,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  'No internet connection!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              SizedBox(
                width: Get.width * .45,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'No internet connection. Make sure that Wifi or Mobile data is turn on.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: appMainColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
