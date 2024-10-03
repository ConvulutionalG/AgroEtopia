class SqliteConstants {
  static String userType_farmer = "farmer";
  static String userType_lab = "lab";

  // Database name
  static String dbName = 'AgroEtopia.db';

  // Table names
  static String farmerRequestTable = 'farmer_request_table';
  static String loginTable = 'login_table';

  // Column names for 'farmerRequestTable' table
  static String farmerRequestId = 'farmer_request_id';
  static String farmerId = 'farmer_id';
  static String farmerName = 'farmer_name';
  static String farmerSelectLab = 'farmer_select_lab';
  static String farmerSelectCrop = 'farmer_select_crop';
  static String farmerDatePlanted = 'farmer_date_planted';
  static String farmerAcresLand = 'farmer_acres_land';
  static String farmerLotNo = 'farmer_lot_no';
  static String farmerHarvestDate = 'farmer_harvest_date';
  static String farmerVariety = 'farmer_variety';
  static String farmerGPSCoordinates = 'farmer_gps_coordinates';
  static String farmerRemarks = 'farmer_remarks';
  static String farmerRequestDateTime = 'farmer_request_datetime';
  static String labInspectionDate = 'lab_inspection_date';
  static String labRemarks = 'lab_remarks';
  static String lab_request_status = 'lab_request_status';
  static String lab_request_datetime = 'lab_request_datetime';

  // static String lab_upload_bacteria_select_farmer =
  //     'lab_upload_bacteria_select_farmer';
  // static String lab_upload_bacteria_select_inspection_date =
  //     'lab_upload_bacteria_select_inspection_date';
  static String lab_upload_bacteria_select_lab =
      'lab_upload_bacteria_select_lab';
  static String lab_upload_bacteria_select_planted_date =
      'lab_upload_bacteria_select_planted_date';
  static String lab_upload_bacteria_select_crop =
      'lab_upload_bacteria_select_crop';
  static String lab_upload_bacteria_upload_file =
      'lab_upload_bacteria_upload_file';
  static String lab_upload_bacteria_upload_file_name =
      'lab_upload_bacteria_upload_file_name';
  static String lab_bacteria_count = 'lab_bacteria_count';

  // SQL Queries
  static String createFarmerRequestTable = '''
CREATE TABLE $farmerRequestTable (
  $farmerRequestId INTEGER PRIMARY KEY AUTOINCREMENT,
  $farmerId TEXT NOT NULL,
  $farmerSelectLab TEXT NOT NULL,
  $farmerSelectCrop TEXT NOT NULL,
  $farmerDatePlanted TEXT NOT NULL,
  $farmerAcresLand TEXT NOT NULL,
  $farmerLotNo TEXT NOT NULL,
  $farmerHarvestDate TEXT NOT NULL,
  $farmerVariety TEXT NOT NULL,
  $farmerGPSCoordinates TEXT NOT NULL,
  $farmerRemarks TEXT NOT NULL,
  $farmerRequestDateTime TEXT NOT NULL,
  $labInspectionDate TEXT NULL,
  $labRemarks TEXT NULL,
  $lab_request_status TEXT NULL,
  $lab_request_datetime TEXT NULL,
  $lab_upload_bacteria_select_lab TEXT NULL,
  $lab_upload_bacteria_select_planted_date TEXT NULL,
  $lab_upload_bacteria_select_crop TEXT NULL,
  $lab_upload_bacteria_upload_file TEXT NULL,
  $lab_upload_bacteria_upload_file_name TEXT NULL,
  $lab_bacteria_count TEXT NULL
)
''';

  // Column names for 'login' table
  static String user_id = 'user_id';
  static String name = 'name';
  static String mobile_number = 'mobile_number';
  static String user_type = 'user_type';
  static String user_name = 'user_name';
  static String user_password = 'user_password';
  static String user_active = 'user_active';

  static String createLoginTable = '''
CREATE TABLE $loginTable (
  $user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  $name TEXT NOT NULL,
  $mobile_number TEXT NOT NULL,
  $user_type TEXT NOT NULL,
  $user_name TEXT NOT NULL,
  $user_password TEXT NOT NULL,
  $user_active TEXT NOT NULL
)
''';
}
