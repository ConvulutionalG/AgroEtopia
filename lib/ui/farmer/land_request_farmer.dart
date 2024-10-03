import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/ui/farmer/controller/land_request_farmer_controller.dart';
import 'package:crop_yield/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/AppConstants.dart';
import '../../resources/color_resources.dart';
import '../../resources/style_resources.dart';
import '../../utils/app_utils.dart';
import '../../widgets/AppBarView.dart';
import '../../widgets/BorderedDropdown.dart';
import '../../widgets/myInkWell.dart';
import '../../widgets/my_textfield.dart';

class LandRequestFarmer extends StatefulWidget {
  @override
  State<LandRequestFarmer> createState() => _LandRequestFarmerState();
}

class _LandRequestFarmerState extends State<LandRequestFarmer> {
  final _formKey = GlobalKey<FormState>();
  final LandRequestFarmerController controller =
      Get.put(LandRequestFarmerController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.clearData(_formKey);
      controller.lotNoController.value.text =
          LandRequestFarmerController.preLotNo.value;
      controller.harvestDateController.value.text =
          LandRequestFarmerController.preHarvestDate.value;
      controller.gpsCoordinatesController.value.text =
          LandRequestFarmerController.preGPS.value;
      controller.remarksController.value.text =
          LandRequestFarmerController.preRemarks.value;
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
          appBar: AppBarView(title: TextFile.inviteLab),
          body: GetBuilder<LandRequestFarmerController>(
              builder: (landRequestFarmerController) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          showDropDownView(
                              TextFile.selectLab,
                              landRequestFarmerController,
                              0,
                              landRequestFarmerController.selectedLab.value,
                              TextFile.labList,
                              _formKey, (value) {
                            if (value == null || value.isEmpty) {
                              return TextFile.selectLab;
                            }
                            return null;
                          }),
                          showDropDownView(
                              TextFile.selectCrop,
                              landRequestFarmerController,
                              1,
                              landRequestFarmerController.selectedCrop!.value,
                              TextFile.cropList,
                              _formKey, (value) {
                            if (value == null) {
                              return TextFile.selectCrop;
                            }
                            return null;
                          }),
                          textFieldView(
                              TextFile.datePlanted,
                              TextFile.hintDatePlanted,
                              node,
                              landRequestFarmerController.datePlanedController
                                  .value, validator: (value) {
                            if (landRequestFarmerController
                                .datePlanedController.value.text.isEmpty) {
                              return TextFile.selectDatePlanted;
                            }

                            return null;
                          }, onTap: () {
                            landRequestFarmerController.openDatePicker(0);
                          }),
                          textFieldView(
                              TextFile.acresLand,
                              TextFile.hintAcresLand,
                              maxLenght: 92,
                              node,
                              landRequestFarmerController.acresLandController
                                  .value, validator: (value) {
                            print("CCCCC===>>>>$value");
                            if (value == null || value!.isEmpty) {
                              return TextFile.enterAcresLand;
                            }
                            return null;
                          }),
                          textFieldView(
                              TextFile.lotNo,
                              TextFile.hintLotNo,
                              maxLenght: 50,
                              node,
                              landRequestFarmerController.lotNoController.value,
                              validator: (value) {
                            print(
                                'objectcheck -> ${landRequestFarmerController.lotNoController.value.text}');
                            print('valuevaluevalue -> ${value}');
                            if (value == null || value.isEmpty) {
                              return TextFile.enterLotNo;
                            }
                            return null;
                          }),
                          textFieldView(
                              TextFile.harvestDate,
                              TextFile.hintHarvestDate,
                              node,
                              landRequestFarmerController.harvestDateController
                                  .value, validator: (value) {
                            if (landRequestFarmerController
                                .harvestDateController.value.text.isEmpty) {
                              return TextFile.selectHarvestPlanted;
                            }
                            return null;
                          }, onTap: () {
                            landRequestFarmerController.openDatePicker(1);
                          }),
                          textFieldView(
                            TextFile.variety,
                            maxLenght: 500,
                            TextFile.hintVariety,
                            node,
                            landRequestFarmerController.varietyController.value,
                            showValidation: false,
                          ),
                          textFieldView(
                            TextFile.gpsCoordinates,
                            TextFile.hintGpsCoordinates,
                            maxLenght: 50,
                            node,
                            landRequestFarmerController
                                .gpsCoordinatesController.value,
                            showValidation: false,
                          ),
                          textFieldView(
                            TextFile.remarks,
                            TextFile.enterRemarks,
                            node,
                            maxLenght: 500,
                            landRequestFarmerController.remarksController.value,
                            maxLine: 4,
                            textInputAction: TextInputAction.done,
                            showValidation: false,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: Row(
                        children: [
                          Expanded(
                            child: btn(TextFile.sendRequest, btn_color, 0,
                                landRequestFarmerController, context),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          btn(TextFile.clear, color_78B5A21, 1,
                              landRequestFarmerController, context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        )));
  }

  showDropDownView(
    String title,
    LandRequestFarmerController landRequestFarmerController,
    int i,
    String value,
    List<String> list,
    GlobalKey<FormState> formKey,
    String? Function(String?)? validator,
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
            formKey: formKey,
            onSelectedDropdown: (String value) {
              if (i == 0) {
                landRequestFarmerController.selectedLab = value!.obs;
              } else {
                landRequestFarmerController.selectedCrop = value!.obs;
                if (landRequestFarmerController.selectedCrop.value ==
                    TextFile.cabBarley) {
                  landRequestFarmerController.varietyController.value.text =
                      "Barley Flakes, Quick Cooking Barley";
                } else {
                  landRequestFarmerController.varietyController.value.text =
                      "Salintuya, Songda, Quarshie";
                }
              }
              landRequestFarmerController.update();
            },
            validator: validator,
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
      int? maxLenght,
      String? Function(String?)? validator,
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
            maxLength: maxLenght,
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
            validator: validator,
            maxLine: maxLine,
            formKey: _formKey,
          )
        ],
      ),
    );
  }

  btn(
      String text,
      Color bgColor,
      int i,
      LandRequestFarmerController landRequestFarmerController,
      BuildContext context) {
    return myInkWell(
      onTap: () async {
        if (i == 0) {
          landRequestFarmerController.checkValidation(_formKey);
        } else {
          landRequestFarmerController.clearData(_formKey);
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
