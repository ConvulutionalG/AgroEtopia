import 'package:crop_yield/constants/routes_constants.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/ui/auth/controller/auth_controller.dart';
import 'package:crop_yield/utils/navigateUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/AppConstants.dart';
import '../../resources/color_resources.dart';
import '../../resources/style_resources.dart';
import '../../utils/app_utils.dart';
import '../../utils/widget_utils.dart';
import '../../widgets/AppBarView.dart';
import '../../widgets/btn_view.dart';
import '../../widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppUtils.changeStatusBarColor();
    final node = FocusScope.of(context);

    return Container(
      color: backgroundColor,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBarView(showLogOutIcon: false),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [AuthController.to.loginAppIconView()],
        ),
        backgroundColor: backgroundColor,
        body: GetBuilder<AuthController>(
          builder: (controller) {
            return Center(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.end,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                          style: heading3TextStyle(
                              colors: appMainColor,
                              fontWeight: FontWeight.bold,
                              size: 25,
                              fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                            text: 'Agro',
                            style: heading3TextStyle(
                                colors: Colors.green,
                                fontWeight: FontWeight.bold,
                                size: 25,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                          text: ' ', // Add space between 'Egro' and 'Etopia'
                        ),
                        TextSpan(
                          text: 'Etopia',
                          style: heading3TextStyle(
                              colors: Colors.orange,
                              fontWeight: FontWeight.bold,
                              size: 25,
                              fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text: ' ', // Add space between 'Egro' and 'Etopia'
                        ),
                        TextSpan(
                          text: ' ', // Add space between 'Egro' and 'Etopia'
                        ),
                        // TextSpan(
                        //   text: TextFile.demo,
                        //   style: heading3TextStyle(
                        //       colors: color_044F68,
                        //       fontWeight: FontWeight.w500),
                        // ),
                      ],
                    ),
                  ),
                  // Text.rich(
                  //   textAlign: TextAlign.end,
                  //   TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "${TextFile.welcomeAgroEtopia}\n",
                  //         style: heading3TextStyle(
                  //             colors: Colors.blue, fontWeight: FontWeight.w500),
                  //       ),
                  //       TextSpan(
                  //         text: TextFile.demo,
                  //         style: heading3TextStyle(
                  //             colors: color_044F68,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Expanded(
                      child: SingleChildScrollView(
                    child: topView(controller, node,context),
                  )),
                ],
              ),
            ));
          },
        ),
      )),
    );
  }

  Widget topView(AuthController controller, FocusScopeNode node, BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: WidgetUtils.setBorderDecoration(
                borderWidth: 3, borderRadius: 5),
            child: Column(
              children: [
                Text(
                  TextFile.signInToStartSession,
                  style: heading5TextStyle(
                      colors: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                  focusNode: node,
                  controller: controller.userNameController.value,
                  margin: EdgeInsets.zero,
                  suffixIcon: Icon(
                    Icons.mail,
                    color: color_575E68,
                  ),
                  maxLength: 50,
                  hintText: TextFile.userName,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter Username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  focusNode: node,
                  controller: controller.passwordController.value,
                  margin: EdgeInsets.zero,
                  maxLength: 50,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: Icon(
                          controller.isPasswordShow.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: color_575E68,
                        ),
                        onPressed: () {
                          controller.checkPassword();
                        },
                      ),
                      Container(
                        height: double.infinity,
                        width: textFieldBorderWidth,
                        color: Colors.black,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: Icon(
                          Icons.lock,
                          color: color_575E68,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  hintText: TextFile.password,
                  obscureText: controller.isPasswordShow.value,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: BtnView(
                      text: TextFile.lblSignIn,
                      bgColor: btn_color,
                      onTap: () {
                        controller.signIn(formKey);
                      },
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: BtnView(
                      text: TextFile.lblClear,
                      bgColor: color_78B5A21,
                      onTap: () {
                        controller.clear();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        BtnView(
                          text: TextFile.lblSignUp,
                          bgColor: btn_color,
                          padding:
                              EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                          onTap: () {
                            controller.nameController.value.clear();
                            controller.mobileNumberController.value.clear();
                            controller.signUpUserNameController.value.clear();
                            controller.signUpPasswordController.value.clear();
                            navigateToRout(Routes.signupRoute, context);
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Don't have have an account?",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
