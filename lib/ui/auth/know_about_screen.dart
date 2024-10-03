import 'package:crop_yield/constants/routes_constants.dart';
import 'package:crop_yield/resources/image_resources.dart';
import 'package:crop_yield/utils/navigateUtils.dart';
import 'package:crop_yield/widgets/AppBarView.dart';
import 'package:crop_yield/widgets/myInkWell.dart';
import 'package:crop_yield/widgets/set_custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_resources.dart';
import '../../resources/style_resources.dart';
import '../../text/textfile.dart';
import '../../utils/app_utils.dart';
import '../../utils/widget_utils.dart';
import '../../widgets/btn_view.dart';
import 'controller/auth_controller.dart';

class KnowAboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppUtils.changeStatusBarColor();
    return Container(
        color: backgroundColor,
        child: SafeArea(
            child: Scaffold(
                // appBar: AppBarView(showLogOutIcon: false),
                backgroundColor: backgroundColor,
                body: GetBuilder<AuthController>(builder: (controller) {
                  return Stack(
                    children: [
                      SetCustomImageView(
                        imageUrl:
                            controller.imageList[controller.currentImage.value],
                        height: double.infinity,
                        width: double.infinity,
                        isNetworkImage: false,
                        // boxFit: BoxFit.fill,
                      ),
                      myInkWell(
                        onTap: () {
                          if (controller.currentImage.value !=
                              controller.imageList.length - 1) {
                            controller.currentImage =
                                controller.currentImage + 1;
                            controller.update();
                          } else {
                            navigateToWithRoutClearBack(
                                Routes.loginRoute, context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: color_293344,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: color_293344,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );

                  return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // controller.appIconView(),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Expanded(
                              child: showDataView(controller, context),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // controller.knowAboutIndex.value == 0 ? SizedBox.square() : BtnView(
                                //   text:TextFile.lblBack,
                                //   bgColor: appMainColor,
                                //   padding:
                                //   EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                                //   onTap: () {
                                //     if (controller.knowAboutIndex.value == 0) {
                                //       Navigator.pop(context);
                                //     } else {
                                //       controller.updateKnowAbout(false);
                                //     }
                                //   },
                                // ),

                                controller.knowAboutIndex.value == 0
                                    ? SizedBox.square()
                                    : Container(
                                        decoration: BoxDecoration(
                                          color:
                                              appMainColor, // Background color
                                          shape:
                                              BoxShape.circle, // Circular shape
                                        ),
                                        child: IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          icon: Icon(
                                            size: 30,
                                            Icons.navigate_before,
                                            color: Colors.white, // Icon color
                                          ),
                                          onPressed: () {
                                            if (controller
                                                    .knowAboutIndex.value ==
                                                0) {
                                              Navigator.pop(context);
                                            } else {
                                              controller.updateKnowAbout(false);
                                            }
                                          },
                                        ),
                                      ),

                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: appMainColor, // Background color
                                    shape: BoxShape.circle, // Circular shape
                                  ),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: Icon(
                                      size: 30,
                                      Icons.navigate_next,
                                      color: Colors.white, // Icon color
                                    ),
                                    onPressed: () {
                                      if (controller.knowAboutIndex.value ==
                                          controller
                                                  .knowAboutList!.value.length -
                                              1) {
                                        navigateToWithRoutClearBack(
                                            Routes.loginRoute, context);
                                      } else {
                                        controller.updateKnowAbout(true);
                                      }
                                      // Your onPressed code here
                                    },
                                  ),
                                ),
                                // BtnView(
                                //   text: controller.knowAboutIndex.value !=
                                //           controller.knowAboutList!.value.length - 1
                                //       ? TextFile.lblNext
                                //       : TextFile.lblLogin,
                                //   bgColor: appMainColor,
                                //   padding:
                                //       EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                                //   onTap: () {
                                //     if (controller.knowAboutIndex.value ==
                                //         controller.knowAboutList!.value.length - 1) {
                                //       navigateToWithRoutClearBack(Routes.loginRoute, context);
                                //     } else {
                                //       controller.updateKnowAbout(true);
                                //     }
                                //   },
                                // )
                              ],
                            )
                          ]));
                }))));
  }

  showDataView(AuthController controller, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 8, right: 8, bottom: 15, left: 5),
          decoration:
              WidgetUtils.setBorderDecoration(borderWidth: 2, borderRadius: 5),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 45,
                  width: 45,
                  decoration: WidgetUtils.setDecoration(
                      color: Colors.grey.shade400, borderRadius: 100),
                  child: SetCustomImageView(
                      imageUrl: farmer2Round2Icon, isNetworkImage: false),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.knowAboutList![controller.knowAboutIndex.value]
                          .title,
                      style: heading5TextStyle(
                          colors: color_ffa78b,
                          fontWeight: FontWeight.bold,
                          size: 16
                          // size: controller.knowAboutIndex.value == 1 ? 17 : 20,
                          ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    controller.knowAboutList![controller.knowAboutIndex.value]
                                .subtitle.length ==
                            1
                        ? Text(
                            controller
                                .knowAboutList![controller.knowAboutIndex.value]
                                .subtitle
                                .first,
                            style: heading7TextStyle(
                                colors: Colors.black.withOpacity(.6),
                                size: 14,
                                fontWeight: FontWeight.w500),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .knowAboutList![controller.knowAboutIndex.value]
                                .subtitle
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Container(
                                        width: 5,
                                        height: 5,
                                        margin: EdgeInsets.only(
                                            bottom: 6, right: 5),
                                        decoration: WidgetUtils.setDecoration(
                                            color: Colors.black.withOpacity(.5),
                                            borderRadius: 100),
                                      )),
                                      TextSpan(
                                        text: controller
                                            .knowAboutList![
                                                controller.knowAboutIndex.value]
                                            .subtitle[index],
                                        style: heading7TextStyle(
                                            colors:
                                                Colors.black.withOpacity(.6),
                                            size: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ],
                ))
              ],
            )
          ])),
    );
  }
}
