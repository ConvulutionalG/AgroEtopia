import 'package:crop_yield/text/textfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constants.dart';
import '../../../sqlite_data/sqlite_constants.dart';
import '../../../sqlite_data/sqlite_controller.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/date_utils.dart';
import '../../../utils/log_utils.dart';
import '../../../utils/navigateUtils.dart';
import '../../../utils/shared_preference_data.dart';
import '../../lab/L_i_Detail_Screen/Controller/L_i_Detail_Controller.dart';

class LandRequestFarmerController extends GetxController {
  static LandRequestFarmerController get to => Get.find();
  static RxString preLotNo = "CR-1008-0002".obs;
  static RxString preHarvestDate = "01-08-2024".obs;
  static RxString preGPS = "40.3936° N, 96.9228° W".obs;
  static RxString preRemarks =
      "Plot Type: Strip Trial. Plot Number: 23.11536. Irrigation: Yes.".obs;

  RxString selectedLab = "".obs;
  RxString selectedCrop = "".obs;
  Rx<TextEditingController> datePlanedController = TextEditingController().obs;
  Rx<TextEditingController> acresLandController = TextEditingController().obs;
  Rx<TextEditingController> lotNoController =
      TextEditingController(text: preLotNo.value).obs;
  Rx<TextEditingController> harvestDateController =
      TextEditingController(text: preHarvestDate.value).obs;
  Rx<TextEditingController> varietyController = TextEditingController().obs;
  Rx<TextEditingController> gpsCoordinatesController =
      TextEditingController(text: preGPS.value).obs;
  Rx<TextEditingController> remarksController =
      TextEditingController(text: preRemarks.value).obs;
  DateTime? plantedDate;
  DateTime? harvestDate = DateTime(2024, 8, 1);
  bool isValid = false;

  openDatePicker(int i) {
    openDatePickerDialogView(i == 0 ? plantedDate : harvestDate,
        selected: (date) {
      if (i == 0) {
        plantedDate = date;
        datePlanedController.value.text =
            "${changeDateFormat(date: date, changDateFormat: datePickerDateFormat)}";
      } else {
        harvestDate = date;
        harvestDateController.value.text =
            "${changeDateFormat(date: date, changDateFormat: datePickerDateFormat)}";
      }
      update();
    });
  }

  checkValidation(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      update();
    } else {
      AppUtils.showProgressDialog(Get.context!);
      var userID = await SharedPreferenceData.getStringData(
          SharedPreferenceData.sharedUserId);
      var name = await SharedPreferenceData.getStringData(
          SharedPreferenceData.sharedUserName);
      Map<String, dynamic> data = {
        SqliteConstants.farmerId: userID,
        SqliteConstants.farmerSelectLab: selectedLab.value,
        SqliteConstants.farmerSelectCrop: selectedCrop.value,
        SqliteConstants.farmerDatePlanted: datePlanedController.value.text,
        SqliteConstants.farmerAcresLand: acresLandController.value.text,
        SqliteConstants.farmerLotNo: lotNoController.value.text,
        SqliteConstants.farmerHarvestDate: harvestDateController.value.text,
        SqliteConstants.farmerVariety: varietyController.value.text,
        SqliteConstants.farmerGPSCoordinates:
            gpsCoordinatesController.value.text,
        SqliteConstants.farmerRemarks: remarksController.value.text,
        SqliteConstants.lab_request_status: TextFile.statusRequested,
        SqliteConstants.farmerRequestDateTime: "${DateTime.now()}",
      };
      int inserted = await SqliteController.to.insertSqliteData(
          data: data, tableName: SqliteConstants.farmerRequestTable);
      AppUtils.hideProgressDialog(Get.context!);
      if (inserted > 0) {
        AppUtils.showToast("Successfully request added");
        data[SqliteConstants.farmerRequestId] = "$inserted";
        data[SqliteConstants.farmerName] = "$name";
        showLogs("INSERT FARMER REQUEST", "${data}");
        LabPersonController.to.clearData();
        navigateToRout(Routes.landRequestLabPersonDetailRoute, Get.context!,
            args: data);
        clearData(formKey);
      }
    }

    // var data = await SqliteController.to
    //     .fetchSqliteData(tableName: SqliteConstants.farmerRequestTable);
    // showLogs("DATA", "${data}");
    // }
  }

  clearData(GlobalKey<FormState> formKey) {
    formKey.currentState?.reset();
    selectedLab = "".obs;
    selectedCrop = "".obs;
    datePlanedController.value.clear();
    plantedDate = null;
    acresLandController.value.clear();
    lotNoController.value.clear();
    harvestDateController.value.clear();
    harvestDate = null;
    varietyController.value.clear();
    gpsCoordinatesController.value.clear();
    remarksController.value.clear();
    print("CLEAR===>>>>$formKey");
    formKey.currentState.reactive;
    update();
  }
}
