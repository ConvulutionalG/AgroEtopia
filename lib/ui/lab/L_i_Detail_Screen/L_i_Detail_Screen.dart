import 'package:crop_yield/constants/AppConstants.dart';
import 'package:crop_yield/resources/color_resources.dart';
import 'package:crop_yield/resources/style_resources.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/utils/app_utils.dart';
import 'package:crop_yield/widgets/myInkWell.dart';
import 'package:crop_yield/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sqlite_data/sqlite_constants.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/AppBarView.dart';
import 'Controller/L_i_Detail_Controller.dart';

class LIDetailScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppUtils.changeStatusBarColor();
    final node = FocusScope.of(context);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Container(
        color: backgroundColor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBarView(title: TextFile.inspectionConfirmation),
          body: GetBuilder<LabPersonController>(
              builder: (landRequestLabPersonController) {
            landRequestLabPersonController.farmerPlantedController.value.text =
                "${args[SqliteConstants.farmerName]}";
            landRequestLabPersonController.dateCropController.value.text =
                "${args[SqliteConstants.farmerSelectCrop]}";
            landRequestLabPersonController.datePlanedController.value.text =
                "${args[SqliteConstants.farmerDatePlanted]}";
            landRequestLabPersonController.acresLandController.value.text =
                "${args[SqliteConstants.farmerAcresLand]}";
            landRequestLabPersonController.lotNoController.value.text =
                "${args[SqliteConstants.farmerLotNo]}";
            landRequestLabPersonController.harvestDateController.value.text =
                "${args[SqliteConstants.farmerHarvestDate]}";
            landRequestLabPersonController.gpsCoordinatesController.value.text =
                "${args[SqliteConstants.farmerGPSCoordinates]}";
            landRequestLabPersonController.farmerRemarkController.value.text =
                "${args[SqliteConstants.farmerRemarks]}";
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        textFieldView(
                            TextFile.farmer,
                            TextFile.hintFarmer,
                            node,
                            landRequestLabPersonController
                                .farmerPlantedController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.crop,
                            TextFile.hintCrop,
                            node,
                            landRequestLabPersonController
                                .dateCropController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.datePlanted,
                            "",
                            node,
                            landRequestLabPersonController
                                .datePlanedController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.acresLand,
                            TextFile.hintAcresLand,
                            node,
                            landRequestLabPersonController
                                .acresLandController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.lotNo,
                            "",
                            node,
                            landRequestLabPersonController
                                .lotNoController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.harvestDate,
                            "",
                            node,
                            landRequestLabPersonController
                                .harvestDateController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.gpsCoordinates,
                            "",
                            node,
                            landRequestLabPersonController
                                .gpsCoordinatesController.value,
                            false,
                            readOnly: true),
                        textFieldView(
                            TextFile.farmerRemarks,
                            "",
                            node,
                            landRequestLabPersonController
                                .farmerRemarkController.value,
                            false,
                            maxLine: 4,
                            textInputAction: TextInputAction.done,
                            readOnly: true),
                        Form(
                            key: _formKey,
                            child: textFieldView(
                                TextFile.inspectionDate,
                                TextFile.inspectionDate,
                                node,
                                landRequestLabPersonController
                                    .inspectionDateController.value,
                                validator: (value) {
                                  if (landRequestLabPersonController
                                      .inspectionDateController
                                      .value
                                      .text
                                      .isEmpty) {
                                    return TextFile.inspectionDate;
                                  }
                                  return null;
                                },
                                true,
                                onTap: () {
                                  landRequestLabPersonController
                                      .openDatePicker(1);
                                })),
                        textFieldView(
                            TextFile.remarks,
                            TextFile.remarks,
                            node,
                            landRequestLabPersonController
                                .remarksController.value,
                            false,
                            maxLine: 4,
                            textInputAction: TextInputAction.done),
                      ],
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 13, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: btn(TextFile.accept, color_ededed, 0,
                                landRequestLabPersonController, args)),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: btn(TextFile.reject, color_c7c7c7, 1,
                                landRequestLabPersonController, args)),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        )));
  }

  showTitleView(String title, bool showValidation) {
    return Text(
      showValidation ? "$title* :" : "$title :",
      style: heading7TextStyle(
          colors: color_044F68, fontWeight: FontWeight.w500, size: 16),
    );
  }

  textFieldView(String title, String hint, FocusScopeNode node,
      TextEditingController textEditingController, bool showValidation,
      {onTap,
      bool readOnly = false,
      int? maxLine,
      String? Function(String?)? validator,
      TextInputAction? textInputAction}) {
    return Container(
      margin: EdgeInsets.only(top: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTitleView(title, showValidation),
          SizedBox(
            height: 5,
          ),
          Container(
            color: title == TextFile.inspectionDate || title == TextFile.remarks
                ? null
                : color_c7c7c7,
            child: MyTextField(
              focusNode: node,
              controller: textEditingController,
              hintText: hint,
              margin: EdgeInsets.zero,
              validator: validator,
              textInputAction: textInputAction ?? TextInputAction.next,
              textInputType: maxLine != null
                  ? TextInputType.multiline
                  : TextInputType.text,
              borderWidth: dropDownBorderWidth,
              borderRadius: 0,
              borderColor: color_3d7ebd,
              hintTextStyle: hintStyle(),
              textStyle: textStyle(),
              readOnly: title.toLowerCase().contains("date") ? true : readOnly!,
              onTap: onTap,
              maxLine: maxLine,
            ),
          )
        ],
      ),
    );
  }

  btn(
      String text,
      Color bgColor,
      int i,
      LabPersonController landRequestLabPersonController,
      Map<String, dynamic> args) {
    return myInkWell(
      onTap: () {
        if (i == 0) {
          landRequestLabPersonController.checkValidation(_formKey, args);
        } else {
          landRequestLabPersonController.rejectInspection(args);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: i == 0 ? Colors.green : Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: color_3d7ebd, width: dropDownBorderWidth),
        ),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: heading6TextStyle(
              colors: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
