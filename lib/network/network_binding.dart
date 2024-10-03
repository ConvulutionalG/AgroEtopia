import 'package:get/get.dart';

import '../sqlite_data/sqlite_controller.dart';
import '../ui/auth/controller/auth_controller.dart';
import '../ui/farmer/controller/land_request_farmer_controller.dart';
import '../ui/lab/L_I_Request_Received_Lab_person/controller/LInspectionRequestReceivedLabPersonController.dart';
import '../ui/lab/L_i_Detail_Screen/Controller/L_i_Detail_Controller.dart';
import '../ui/lab/UploadBacteriaFile/uploadBacteriaFileRouteController/uploadBacteriaFileRouteController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SqliteController>(SqliteController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LandRequestFarmerController>(LandRequestFarmerController(),
        permanent: true);
    Get.put<LabPersonController>(LabPersonController(), permanent: true);
    Get.put<LInspectionRequestReceivedLabPersonController>(
        LInspectionRequestReceivedLabPersonController(),
        permanent: true);
    Get.put<UploadBacteriaFileRouteController>(
        UploadBacteriaFileRouteController(),
        permanent: true);
  }
}
