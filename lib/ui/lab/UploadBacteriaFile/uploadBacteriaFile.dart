import 'package:crop_yield/sqlite_data/sqlite_constants.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/ui/lab/UploadBacteriaFile/uploadBacteriaFileRouteController/uploadBacteriaFileRouteController.dart';
import 'package:crop_yield/utils/log_utils.dart';

import 'package:crop_yield/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/AppConstants.dart';
import '../../../resources/color_resources.dart';
import '../../../resources/style_resources.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/AppBarView.dart';
import '../../../widgets/BorderedDropdown.dart';
import '../../../widgets/myInkWell.dart';
import '../../../widgets/my_textfield.dart';

class UploadBacteriaFile extends StatefulWidget {
  @override
  State<UploadBacteriaFile> createState() => _UploadBacteriaFileState();
}

class _UploadBacteriaFileState extends State<UploadBacteriaFile> {
  final UploadBacteriaFileRouteController controller =
      Get.put(UploadBacteriaFileRouteController());
  Map<String, dynamic>? data;

  @override
  void initState() {
    // TODO: implement initState
    controller.clearData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      // Now you can use 'data' as needed
      showLogs("Received data:", '$data');
      controller.selectedLab.value =
          "${data![SqliteConstants.farmerSelectLab]}";
      controller.selectedCrop.value =
          "${data![SqliteConstants.farmerSelectCrop]}";
      controller.datePlanedController.value.text =
          "${data![SqliteConstants.farmerDatePlanted]}";

      setState(() {}); // Trigger a rebuild if needed
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUtils.changeStatusBarColor();
    final node = FocusScope.of(context);

    return Container(
        color: backgroundColor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBarView(title: TextFile.inspectionReport),
          body: GetBuilder<UploadBacteriaFileRouteController>(
              builder: (uploadBacteriaFileRouteController) {
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
                        showDropDownView(
                          TextFile.selectLab,
                          uploadBacteriaFileRouteController,
                          0,
                          uploadBacteriaFileRouteController.selectedLab.value,
                          TextFile.labList,
                        ),
                        textFieldView(
                            TextFile.datePlanted,
                            TextFile.hintDatePlanted,
                            node,
                            uploadBacteriaFileRouteController
                                .datePlanedController.value, onTap: () {
                          // uploadBacteriaFileRouteController.openDatePicker(0);
                        }),
                        showDropDownView(
                          TextFile.selectCrop,
                          uploadBacteriaFileRouteController,
                          1,
                          uploadBacteriaFileRouteController.selectedCrop!.value,
                          TextFile.cropList,
                        ),
                        uploadFileView(TextFile.uploadFile,
                            uploadBacteriaFileRouteController),
                        SizedBox(height: 20),
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
                            child: btn(TextFile.upload, btn_color, 0,
                                uploadBacteriaFileRouteController, context)),
                        uploadBacteriaFileRouteController
                                .selectedFile.value.isEmpty
                            ? SizedBox()
                            : SizedBox(
                                width: 20,
                              ),
                        uploadBacteriaFileRouteController
                                .selectedFile.value.isEmpty
                            ? SizedBox()
                            : Expanded(
                                child: btn(TextFile.clear, color_78B5A21, 1,
                                    uploadBacteriaFileRouteController, context),
                              )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        )));
  }

  uploadFileView(
    String title,
    UploadBacteriaFileRouteController landRequestFarmerController,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTitleView(title, true),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 10),
                  decoration: WidgetUtils.setBorderDecoration(
                      color: color_3d7ebd, borderWidth: 1.2, borderRadius: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          landRequestFarmerController.selectedFile.value.isEmpty
                              ? TextFile.upload
                              : landRequestFarmerController.selectedFile.value,
                          style: landRequestFarmerController
                                  .selectedFile.value.isEmpty
                              ? hintStyle()
                              : textStyle(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          landRequestFarmerController.pickCsvFile();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 15, left: 15),
                          margin: EdgeInsets.only(left: 5),
                          color: color_575E68,
                          child: Text(
                            'Browse',
                            style: heading6TextStyle(
                                colors: backgroundColor,
                                fontWeight: FontWeight.w500,
                                size: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          landRequestFarmerController.selectedFile.value.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 5, left: 12),
                  child: Text("Upload File", style: errorStyle()),
                )
              : SizedBox()
        ],
      ),
    );
  }

  showDropDownView(
    String title,
    UploadBacteriaFileRouteController landRequestFarmerController,
    int i,
    String value,
    List<String> list,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTitleView(title, true),
          SizedBox(
            height: 5,
          ),
          BorderedDropdown(
            hintText: title,
            value: value,
            list: list,
            onSelectedDropdown: (String value) {
              // if (i == 0) {
              //   landRequestFarmerController.selectedLab = value!.obs;
              // } else {
              //   landRequestFarmerController.selectedCrop = value!.obs;
              // }
              // landRequestFarmerController.update();
            },
          )
        ],
      ),
    );
  }

  showTitleView(String title, bool showValidation) {
    return Text(
      showValidation ? "$title* :" : "$title :",
      style: heading7TextStyle(
          colors: color_044F68, fontWeight: FontWeight.w500, size: 16),
    );
  }

  textFieldView(String title, String hint, FocusScopeNode node,
      TextEditingController textEditingController,
      {onTap,
      bool readOnly = false,
      bool showValidation = true,
      int? maxLine,
      TextInputAction? textInputAction}) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTitleView(title, showValidation),
          SizedBox(
            height: 5,
          ),
          MyTextField(
            focusNode: node,
            controller: textEditingController,
            hintText: hint,
            margin: EdgeInsets.zero,
            textInputAction: textInputAction ?? TextInputAction.next,
            textInputType:
                maxLine != null ? TextInputType.multiline : TextInputType.text,
            borderWidth: dropDownBorderWidth,
            borderRadius: 0,
            borderColor: color_3d7ebd,
            hintTextStyle: hintStyle(),
            textStyle: textStyle(),
            readOnly: title.toLowerCase().contains("date") ? true : readOnly!,
            onTap: onTap,
            maxLine: maxLine,
          )
        ],
      ),
    );
  }

  btn(
      String text,
      Color bgColor,
      int i,
      UploadBacteriaFileRouteController landRequestFarmerController,
      BuildContext context) {
    return myInkWell(
      onTap: () async {
        if (i == 0) {
          landRequestFarmerController.checkValidation(data);
        } else {
          landRequestFarmerController.clearData();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: bgColor, width: dropDownBorderWidth),
        ),
        padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: i == 0 ? 20 : 35),
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
