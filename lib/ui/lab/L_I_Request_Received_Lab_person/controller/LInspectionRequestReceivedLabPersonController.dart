import 'package:crop_yield/utils/log_utils.dart';
import 'package:get/get.dart';

import '../../../../sqlite_data/sqlite_constants.dart';
import '../../../../sqlite_data/sqlite_controller.dart';
import '../model/RequestListModel.dart';

class LInspectionRequestReceivedLabPersonController extends GetxController {
  static LInspectionRequestReceivedLabPersonController get to => Get.find();
  List<RequestListModel> requestList = [];

  getData(Map<String, dynamic>? data) async {
    requestList.clear();
    if (data != null) {
      // List<Map<String, dynamic>> list = await SqliteController.to
      //     .fetchSqliteData(tableName: SqliteConstants.farmerRequestTable);
      // showLogs("GET REQUEST DATA 1111", "$list");
      // list.forEach((action) {
      //   RequestListModel requestListModel = RequestListModel.fromJson(action);
      //   requestList.add(requestListModel);
      // });
      // update();

      Map<String, dynamic>? getData = await SqliteController.to.getDataById(
        tableName: SqliteConstants.farmerRequestTable,
        id: data![SqliteConstants.farmerRequestId],
        columnName: SqliteConstants.farmerRequestId,
      );
      // print("GET==>>>$getData");
      showLogs("GET REQUEST DATA", "$getData");

      if (getData != null) {
        RequestListModel requestListModel = RequestListModel.fromJson(getData!);
        requestList.add(requestListModel);
        update();
      }
    }
  }

  updateBacteriaCount(String bacteriaCount, String requestID) async {
    int update = await SqliteController.to.updateDateFromTable(
        data: {
          SqliteConstants.lab_bacteria_count: bacteriaCount,
        },
        tableName: SqliteConstants.farmerRequestTable,
        id: requestID,
        columnName: SqliteConstants.farmerRequestId);
    showLogs("Update bacteria count", "$requestID     UPDATE=> $update");
  }
}
