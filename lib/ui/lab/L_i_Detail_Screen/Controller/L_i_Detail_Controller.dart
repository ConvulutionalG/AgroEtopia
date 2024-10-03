import 'package:crop_yield/constants/routes_constants.dart';
import 'package:crop_yield/sqlite_data/sqlite_constants.dart';
import 'package:crop_yield/sqlite_data/sqlite_controller.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/utils/app_utils.dart';
import 'package:crop_yield/utils/date_utils.dart';
import 'package:crop_yield/utils/log_utils.dart';
import 'package:crop_yield/utils/navigateUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabPersonController extends GetxController {
  static LabPersonController get to => Get.find();

  RxString selectedLab = "".obs;
  RxString selectedCrop = "".obs;
  Rx<TextEditingController> farmerPlantedController =
      TextEditingController().obs;
  Rx<TextEditingController> dateCropController = TextEditingController().obs;
  Rx<TextEditingController> datePlanedController = TextEditingController().obs;
  Rx<TextEditingController> acresLandController = TextEditingController().obs;
  Rx<TextEditingController> lotNoController = TextEditingController().obs;
  Rx<TextEditingController> harvestDateController = TextEditingController().obs;
  Rx<TextEditingController> farmerRemarkController =
      TextEditingController().obs;
  Rx<TextEditingController> inspectionDateController =
      TextEditingController().obs;
  Rx<TextEditingController> gpsCoordinatesController =
      TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;
  DateTime? inspectionDate;

  checkValidation(
      GlobalKey<FormState> formKey, Map<String, dynamic> args) async {
    print("VALIDATio33333===>>>>${formKey.currentState!.validate()}");
    if (!formKey.currentState!.validate()) {
      update();
    } else {
      // navigateToRout(Routes.uploadBacteriaFileRoute, Get.context!);
      acceptInspection(args);
    }
  }

  openDatePicker(int i) {
    openDatePickerDialogView(inspectionDate, selected: (date) {
      inspectionDate = date;
      inspectionDateController.value.text =
          "${changeDateFormat(date: date, changDateFormat: datePickerDateFormat)}";
      update();
    });
  }

  Future<void> acceptInspection(Map<String, dynamic> args) async {
    var requestID = "${args[SqliteConstants.farmerRequestId]}";
    showLogs("acceptInspection", requestID);
    Map<String, dynamic> data = {
      SqliteConstants.labInspectionDate:
          inspectionDateController.value.text.toString(),
      SqliteConstants.labRemarks: remarksController.value.text.toString(),
      SqliteConstants.lab_request_status: TextFile.statusAccepted,
      SqliteConstants.lab_request_datetime: "${DateTime.now()}",
    };
    int update = await SqliteController.to.updateDateFromTable(
        data: data,
        tableName: SqliteConstants.farmerRequestTable,
        id: requestID,
        columnName: SqliteConstants.farmerRequestId);

    showLogs("ACCEPT Inspection UPDATE", "$update");
    if (update > 0) {
      AppUtils.showToast("Accepted");
      navigateToRout(Routes.uploadBacteriaFileRoute, Get.context!, args: args);
    } else {
      AppUtils.showToast("Error");
    }
  }

  rejectInspection(Map<String, dynamic> args) async {
    AppUtils.showProgressDialog(Get.context!);
    var requestID = "${args[SqliteConstants.farmerRequestId]}";
    showLogs("rejectInspection", requestID);
    Map<String, dynamic> data = {
      SqliteConstants.lab_request_status: TextFile.statusRejected,
      SqliteConstants.lab_request_datetime: "${DateTime.now()}",
    };
    int update = await SqliteController.to.updateDateFromTable(
        data: data,
        tableName: SqliteConstants.farmerRequestTable,
        id: requestID,
        columnName: SqliteConstants.farmerRequestId);
    AppUtils.hideProgressDialog(Get.context!);
    showLogs("rejectInspection UPDATE", "$update");
    if (update > 0) {
      AppUtils.showToast("Rejected");
      navigateToWithRoutClearBack(Routes.landRequestFarmerRoute, Get.context!);
    } else {
      AppUtils.showToast("Error");
    }
  }

  clearData() {
    farmerPlantedController.value.clear();
    dateCropController.value.clear();
    datePlanedController.value.clear();
    acresLandController.value.clear();
    lotNoController.value.clear();
    harvestDateController.value.clear();
    farmerRemarkController.value.clear();
    inspectionDateController.value.clear();
    gpsCoordinatesController.value.clear();
    gpsCoordinatesController.value.clear();
    remarksController.value.clear();
    inspectionDate = null;
    update();
  }
}
