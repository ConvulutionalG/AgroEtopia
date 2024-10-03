import 'package:crop_yield/widgets/set_custom_image_view.dart';
import 'package:flutter/material.dart';

import '../resources/color_resources.dart';
import '../resources/image_resources.dart';
import '../resources/style_resources.dart';
import '../text/textfile.dart';
import '../utils/widget_utils.dart';

PreferredSizeWidget AppBarView({String? title, bool showLogOutIcon = true}) {
  return AppBar(
    centerTitle: false,
    backgroundColor: color_e8f0fb,
    toolbarHeight: 40,
    automaticallyImplyLeading: false, // Removes the back button
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.symmetric(vertical: 3),
          // decoration: BoxDecoration(
          //   color: Colors.white, // Background color
          //   shape: BoxShape.circle, // Circular shape
          // ),
          child: SetCustomImageView(
            imageUrl: app_icon_transparant,
            height: double.infinity,
            width: double.infinity,
            isNetworkImage: false,
            radius: 100,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title ?? TextFile.topAgroEtopia,
            style: heading6TextStyle(
                size: 14, colors: color_3d7ebd, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
    actions: showLogOutIcon ? WidgetUtils.showLogoutIcon() : [],
  );
}
