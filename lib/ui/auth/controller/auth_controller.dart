import 'package:crop_yield/sqlite_data/sqlite_constants.dart';
import 'package:crop_yield/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constants.dart';
import '../../../resources/image_resources.dart';
import '../../../sqlite_data/sqlite_controller.dart';
import '../../../utils/navigateUtils.dart';
import '../../../utils/shared_preference_data.dart';
import '../../../widgets/set_custom_image_view.dart';
import '../model/KnowAboutModel.dart';
import '../model/LoginUserListModel.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  //SignUP
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> signUpUserNameController =
      TextEditingController().obs;
  Rx<TextEditingController> signUpPasswordController =
      TextEditingController().obs;

  RxBool isPasswordShow = true.obs;

  RxList<LoginUserListModel>? loginUserList = <LoginUserListModel>[].obs;
  RxList<String> imageList = <String>[
    image1,
    image2,
    image3,
  ].obs;
  RxInt currentImage = 0.obs;

  signup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      update();
    } else {
      var check = await SqliteController.to.checkAndInsert(
          tableName: SqliteConstants.loginTable,
          data: {
            SqliteConstants.user_type: SqliteConstants.userType_farmer,
            SqliteConstants.name: nameController.value.text,
            SqliteConstants.mobile_number: mobileNumberController.value.text,
            SqliteConstants.user_name: signUpUserNameController.value.text,
            SqliteConstants.user_password: signUpPasswordController.value.text,
            SqliteConstants.user_active: "true",
          },
          paramName: SqliteConstants.user_name);

      if (check) {
        AppUtils.showToast("Signup successfully");
        userNameController.value.clear();
        passwordController.value.clear();
        Get.back();
      } else {
        AppUtils.showToast("Data already exists");
      }
    }
  }

  Widget appIconView() {
    return Center(
      child: SetCustomImageView(
        imageUrl: app_icon_transparant,
        height: knowAboutIndex.value == 1 ? 100 : 160,
        isNetworkImage: false,
      ),
    );
  }

  Widget loginAppIconView() {
    return SetCustomImageView(
      imageUrl: app_icon_transparant,
      height: 70,
      width: 70,
      isNetworkImage: false,
    );
  }

  checkPassword() {
    if (isPasswordShow.value) {
      isPasswordShow = false.obs;
    } else {
      isPasswordShow = true.obs;
    }
    update();
  }

  signIn(GlobalKey<FormState> formKey) async {
    // print("VALIDATio33333===>>>>${formKey.currentState!.validate()}");

    if (!formKey.currentState!.validate()) {
      update();
    } else {
      loginUserList!.clear();
      var data = await SqliteController.to
          .fetchSqliteData(tableName: SqliteConstants.loginTable);
      // showLogs("LOGIN DATA", "${data}");
      data.forEach((data) {
        LoginUserListModel requestListModel = LoginUserListModel.fromJson(data);
        loginUserList!.add(requestListModel);
      });
      var loggedInSuccessfully = false;
      LoginUserListModel? loggedInUser;
      for (var i = 0; i < loginUserList!.length; i++) {
        var user = loginUserList![i];
        if (user.user_name == userNameController.value.text &&
            user.user_password == passwordController.value.text) {
          AppUtils.showToast("Sign in successfully");
          loggedInSuccessfully = true;
          loggedInUser = user;
          break;
        }
      }
      if (!loggedInSuccessfully) {
        AppUtils.showToast("Sign in failed");
      } else {
        SharedPreferenceData.storeStringData(SharedPreferenceData.sharedUserId,
            loggedInUser!.user_id.toString());
        SharedPreferenceData.storeStringData(
            SharedPreferenceData.sharedUserName, loggedInUser!.user_name);
        SharedPreferenceData.storeStringData(
            SharedPreferenceData.sharedUserType, loggedInUser!.user_type);
        navigateToWithRoutClearBack(
            Routes.landRequestFarmerRoute, Get.context!);
      }
    }
  }

  RxList<KnowAboutModel>? knowAboutList = <KnowAboutModel>[
    KnowAboutModel(
      1,
      "Problem Statement",
      [
        "In a world grappling with a land crisis and limited agricultural space, harnessing technology to increase crop growth is crucial for sustainable food production.",
      ],
    ),
    KnowAboutModel(
      2,
      "Solution - SMART AGRICULTURE",
      [
        "This app is about how to do smart agriculture and estimate the accurate crop-yield based on the hundreds of different bacterial composition of the land using Machine learning models and algorithms.",
        "This helps learning the ways in which naturally occurring bacteria can help increase plant growth and reforestation.",
        "This was made possible by examining a huge dataset, and to build and train a machine learning model to predict crop yield from soil composition."
            "This gives a huge leverage to the farmers in accurately estimating all downstream expenses and outflows beforehand, which helps increase the monetary gains from the production.",
        "This enables farmers to select areas to farm rather than selecting areas by lottery or random chance."
      ],
    ),
    KnowAboutModel(
      3,
      "Engineering Goals",
      [
        "How can bacteria living in the soil correlate to increased barley crop yield?",
        "Can the machine learning models outperform random farm selection?",
        "Which machine learning regression model is better equipped to differentiate and predict the effects of different bacterial strains on plant growth?",
      ],
    ),
    KnowAboutModel(
      4,
      "Model Evaluation Method",
      [
        "There are two popular metrics that usually report to measure repressor performance.",
        "Coefficient of determination (R2 ). Since R is the correlation between the test predictions and the true test y-values, R2 is a measure of how well the variability in the test predictions are explained by the variability in the true values. I computed R2 using the r2_score function. Correlation between data points can be described in the form of visual images. R2 can be used to evaluate the performance of any regression model, since regression models are predicting continuous variables.",
        "Mean Absolute Error (MAE) The mean absolute error is the average error between test predictions and true values of y. I computed the Mean Absolute Error using the sklearn mean_absolute_error function for all my computation work on various machine learning models.",
      ],
    ),
    // KnowAboutModel(
    //   4,
    //   "Model Evaluation Method 1",
    //   [
    //     "Coefficient of determination (R2 ). Since R is the correlation between the test predictions and the true test y-values, R2 is a measure of how well the variability in the test predictions are explained by the variability in the true values. I computed R2 using the r2_score function. Correlation between data points can be described in the form of visual images. R2 can be used to evaluate the performance of any regression model, since regression models are predicting continuous variables.",
    //   ],
    // ),
    // KnowAboutModel(
    //   4,
    //   "Model Evaluation Method 2",
    //   [
    //     "Mean Absolute Error (MAE) The mean absolute error is the average error between test predictions and true values of y. I computed the Mean Absolute Error using the sklearn mean_absolute_error function for all my computation work on various machine learning models.",
    //   ],
    // ),
    KnowAboutModel(
      5,
      "Conclusion",
      [
        "High prevelance plant soil bacteria are helpful in plant growth.",
        "The output after rigorously training my 2 models on 2 major machine learning algorithms to predict the crop yield was completely aligning with the hypothesis of this engagement and it has outperformed random farm selection.",
        "The outcome of two standard universal metrics that were used to measure regression performance was consistent. As a result, finally KNeighbors Repressor was chosen a model to take out the findings into public.",
      ],
    ),
  ].obs;

  RxInt knowAboutIndex = 0.obs;

  updateKnowAbout(bool isUp) {
    if (isUp) {
      knowAboutIndex = knowAboutIndex.value.obs + 1;
    } else {
      knowAboutIndex = knowAboutIndex.value.obs - 1;
    }
    update();
  }

  void clear() {
    userNameController.value.clear();
    passwordController.value.clear();
    update();
  }
}
