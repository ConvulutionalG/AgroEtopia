import 'package:crop_yield/constants/routes_constants.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:crop_yield/ui/lab/L_I_Request_Received_Lab_person/model/RequestListModel.dart';
import 'package:crop_yield/ui/lab/WebViewScreen/WebViewScreen.dart';
import 'package:crop_yield/utils/navigateUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/AppConstants.dart';
import '../../../resources/color_resources.dart';
import '../../../resources/style_resources.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/date_utils.dart';
import '../../../utils/log_utils.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/AppBarView.dart';
import '../../../widgets/myInkWell.dart';
import 'controller/LInspectionRequestReceivedLabPersonController.dart';

class LInspectionRequestReceivedLabPerson extends StatefulWidget {
  @override
  State<LInspectionRequestReceivedLabPerson> createState() =>
      _LInspectionRequestReceivedLabPersonState();
}

class _LInspectionRequestReceivedLabPersonState
    extends State<LInspectionRequestReceivedLabPerson> {
  var TAG = "LInspectionRequestReceivedLabPerson";

  // final UploadBacteriaFileRouteController controller =
  // Get.put(UploadBacteriaFileRouteController());
  Map<String, dynamic>? data;
  var soyabeanDate = "";

  @override
  void initState() {
    // TODO: implement initState
    // controller.clearData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      // Now you can use 'data' as needed
      // showLogs("$TAG Received data:", '$data');
      LInspectionRequestReceivedLabPersonController.to.getData(data);
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
            appBar: AppBarView(title: TextFile.cropEstimationPrediction),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GetBuilder<LInspectionRequestReceivedLabPersonController>(
                  builder: (controller) {
                if (controller.requestList.isNotEmpty) {
                  soyabeanDate = gettingSoyabeanDate(
                      controller.requestList.first.labInspectionDate);
                }
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(color: Colors.blue, width: 1),
                      // Set table border color and width
                      columnWidths: {
                        0: FlexColumnWidth(1), // Farmer column
                        1: FlexColumnWidth(1), // Crop column
                        2: FlexColumnWidth(1.2), // Requested On column
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[300], // Set top header background color
                          ),
                          children: [
                            _buildHeaderCell('Crop'),
                            _buildHeaderCell('Inspection On'),
                            _buildHeaderCell('Action'),
                          ],
                        ),
                        ...controller.requestList.map((row) {
                          return _buildDataRow(
                              '${row.labUploadBacteriaSelectCrop}',
                              '${row.labInspectionDate}',
                              context,
                              row.farmerRequestId.toString());
                        }),
                        _buildDataRow(
                            TextFile.cabSoyabean, soyabeanDate, context, "")
                      ],
                    ),
                  ],
                ));
              }),
            ),
          ),
        ));
  }

  gettingSoyabeanDate(String dateString) {
    DateFormat dateFormat = DateFormat(datePickerDateFormat);

    // Parse the date string to a DateTime object
    DateTime dateTime = dateFormat.parse(dateString);

    // Subtract 10 days
    DateTime newDateTime = dateTime.subtract(Duration(days: 10));

    // Format the new DateTime back to a string
    String newDateString = dateFormat.format(newDateTime);
    print("newDateString===>>>$newDateString");
    return newDateString;
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: heading7TextStyle(
            colors: Colors.black, fontWeight: FontWeight.w500, size: 12),
        textAlign: TextAlign.start,
      ),
    );
  }

  TableRow _buildDataRow(
    String crop,
    String inspectionDate,
    BuildContext context,
    String requestID,
  ) {
    return TableRow(
      children: [
        _buildDataCell(crop),
        _buildDataCell(inspectionDate),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextButton(
            onPressed: () {
              var URL = TextFile.webURL + "${crop.toLowerCase()}";
              showLogs(TAG, "URL==>> $URL");
              navigateTo(
                  WebViewScreen(
                    URL,
                    onValueGet: (String value) {
                      Navigator.pop(context);
                      print('VALUE===>>>>> ${value.toString()}');
                      _showCustomDialog2(context, value, crop, requestID);
                    },
                  ),
                  context);
              // _showCustomDialog2(context, "0.06", crop, requestID);
            },
            child: Text(
              'Estimate Crop Prediction',
              style: heading7TextStyle(
                  colors: Colors.indigo,
                  fontWeight: FontWeight.w600,
                  size: 13,
                  isShowUnderLine: true,
                  underLineColor: Colors.indigo),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 6, right: 6, top: 8, bottom: 8),
      child: Text(
        text,
        style: heading7TextStyle(
            colors: color_044F68, fontWeight: FontWeight.w400, size: 11),
        // Set data text color to blue
        textAlign: TextAlign.start,
      ),
    );
  }

  btn(String text, Color bgColor, int i, BuildContext context) {
    return myInkWell(
      onTap: () async {
        // Navigator.pop(context);
        navigateToWithRoutClearBack(Routes.thankYouRoute, context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(0)),
          border: Border.all(color: bgColor, width: dropDownBorderWidth),
        ),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 25),
        alignment: Alignment.center,
        child: Text(
          text,
          style: heading7TextStyle(
              colors: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _showCustomDialog2(
    BuildContext context,
    String bacteriaCount,
    String crop,
    String requestID,
  ) {
    if (requestID.isNotEmpty) {
      LInspectionRequestReceivedLabPersonController.to
          .updateBacteriaCount(bacteriaCount, requestID);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: backgroundColor, // Background color
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Ensures the column takes up minimal space
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Aligns children to the start
                  children: <Widget>[
                    Text(
                      'AgroEtopia',
                      style: heading5TextStyle(
                          colors: appMainColor, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 50,
                          color: color_3d7ebd,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            // '${crop} estimated prediction value is $bacteriaCount.',
                            "This is your soil's yield for ${crop.toLowerCase()}...[$bacteriaCount] metric tons per acre",
                            style: heading7TextStyle(
                                colors: color_3d7ebd,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Adds space between the text and the button
                    Align(
                      alignment: Alignment.center,
                      child: btn(TextFile.okGet, btn_color, 2, context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
