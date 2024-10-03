import 'package:crop_yield/utils/log_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;

import '../../../../constants/routes_constants.dart';
import '../../../../sqlite_data/sqlite_constants.dart';
import '../../../../sqlite_data/sqlite_controller.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/date_utils.dart';
import '../../../../utils/navigateUtils.dart';


class UploadBacteriaFileRouteController extends GetxController {
  static UploadBacteriaFileRouteController get to => Get.find();

  RxString selectedLab = "".obs;
  RxString selectedCrop = "".obs;
  Rx<TextEditingController> datePlanedController = TextEditingController().obs;
  DateTime? plantedDate;

  RxString selectedFile = ''.obs;
  RxString selectedFilePath = ''.obs;

  void pickCsvFile() async {
    if (io.Platform.isAndroid || io.Platform.isIOS) {
      // Platform is Android or iOS
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['csv', 'CSV'],
          // type: FileType.any,
        );

        if (result != null) {
          PlatformFile file = result.files.first;
          if (file.extension == 'csv') {
            String filePath = result.files.single.path ?? '';
            showLogs('Selected file:', '${file.name}    PATH==>>$filePath');
            String fileName = p.basename(filePath);
            selectedFile.value = fileName;
            selectedFilePath.value = filePath;
            update();
          } else {
            AppUtils.showToast('Not a CSV file: ${file.name}');
            showLogs('Not a CSV file: ', '${file.name}');
          }
        } else {
          AppUtils.showToast('No file selected');
          showLogs('No file selected', '');
        }
      } catch (e) {
        showLogs('Error picking file: ', '$e');
        AppUtils.showToast("Error picking file: $e");
      }
    } else {
      AppUtils.showToast("File picker not supported on this platform");
    }
  }

  openDatePicker(int i) {
    openDatePickerDialogView(plantedDate, selected: (date) {
      if (i == 0) {
        plantedDate = date;
        datePlanedController.value.text =
            "${changeDateFormat(date: date, changDateFormat: datePickerDateFormat)}";
      }
      update();
    });
  }

  checkValidation(Map<String, dynamic>? argData) async {
    if (argData != null) {
      if (selectedFile.value.isNotEmpty) {
        AppUtils.showProgressDialog(Get.context!);
        var requestID = "${argData![SqliteConstants.farmerRequestId]}";
        Map<String, dynamic> data = {
          SqliteConstants.lab_upload_bacteria_select_lab: selectedLab.value,
          SqliteConstants.lab_upload_bacteria_select_planted_date:
              datePlanedController.value.text,
          SqliteConstants.lab_upload_bacteria_select_crop: selectedCrop.value,
          SqliteConstants.lab_upload_bacteria_upload_file:
              selectedFilePath.value,
          SqliteConstants.lab_upload_bacteria_upload_file_name:
              selectedFile.value,
        };
        showLogs("Upload bacteria", requestID);
        int update = await SqliteController.to.updateDateFromTable(
            data: data,
            tableName: SqliteConstants.farmerRequestTable,
            id: requestID,
            columnName: SqliteConstants.farmerRequestId);
        AppUtils.hideProgressDialog(Get.context!);
        if (update > 0) {
          data.addAll(argData);
          // showLogs("Upload bacteria DATA", "$data");
          navigateToRout(Routes.landRequestLabPersonRoute, Get.context!,
              args: data);
        }
      }
    }
  }

  clearData() {
    // selectedLab = "".obs;
    // selectedCrop = "".obs;
    selectedFile = "".obs;
    selectedFilePath = "".obs;
    // datePlanedController.value.clear();
    // plantedDate = null;
    update();
  }
}
