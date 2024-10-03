class RequestListModel {
  int farmerRequestId;
  String farmerId;
  String farmerSelectLab;
  String farmerSelectCrop;
  String farmerDatePlanted;
  String farmerAcresLand;
  String farmerLotNo;
  String farmerHarvestDate;
  String farmerVariety;
  String farmerGpsCoordinates;
  String farmerRemarks;
  String farmerRequestDatetime;
  String labInspectionDate;
  String labRemarks;
  String labRequestStatus;
  String labRequestDatetime;
  String labUploadBacteriaSelectLab;
  String labUploadBacteriaSelectPlantedDate;
  String labUploadBacteriaSelectCrop;
  String labUploadBacteriaUploadFile;
  String labUploadBacteriaUploadFileName;
  String labBacteriaCount;

  RequestListModel({
    required this.farmerRequestId,
    required this.farmerId,
    required this.farmerSelectLab,
    required this.farmerSelectCrop,
    required this.farmerDatePlanted,
    required this.farmerAcresLand,
    required this.farmerLotNo,
    required this.farmerHarvestDate,
    required this.farmerVariety,
    required this.farmerGpsCoordinates,
    required this.farmerRemarks,
    required this.farmerRequestDatetime,
    required this.labInspectionDate,
    required this.labRemarks,
    required this.labRequestStatus,
    required this.labRequestDatetime,
    required this.labUploadBacteriaSelectLab,
    required this.labUploadBacteriaSelectPlantedDate,
    required this.labUploadBacteriaSelectCrop,
    required this.labUploadBacteriaUploadFile,
    required this.labUploadBacteriaUploadFileName,
    required this.labBacteriaCount,
  });

  factory RequestListModel.fromJson(Map<String, dynamic> json) =>
      RequestListModel(
        farmerRequestId: json["farmer_request_id"] ?? 0,
        farmerId: json["farmer_id"] ?? "",
        farmerSelectLab: json["farmer_select_lab"] ?? '',
        farmerSelectCrop: json["farmer_select_crop"] ?? '',
        farmerDatePlanted: json["farmer_date_planted"] ?? '',
        farmerAcresLand: json["farmer_acres_land"] ?? '',
        farmerLotNo: json["farmer_lot_no"] ?? '',
        farmerHarvestDate: json["farmer_harvest_date"] ?? '',
        farmerVariety: json["farmer_variety"] ?? '',
        farmerGpsCoordinates: json["farmer_gps_coordinates"] ?? '',
        farmerRemarks: json["farmer_remarks"] ?? '',
        farmerRequestDatetime: json["farmer_request_datetime"] ?? '',
        labInspectionDate: json["lab_inspection_date"] ?? '',
        labRemarks: json["lab_remarks"] ?? '',
        labRequestStatus: json["lab_request_status"] ?? '',
        labRequestDatetime: json["lab_request_datetime"] ?? '',
        labUploadBacteriaSelectLab:
            json["lab_upload_bacteria_select_lab"] ?? '',
        labUploadBacteriaSelectPlantedDate:
            json["lab_upload_bacteria_select_planted_date"] ?? '',
        labUploadBacteriaSelectCrop:
            json["lab_upload_bacteria_select_crop"] ?? '',
        labUploadBacteriaUploadFile:
            json["lab_upload_bacteria_upload_file"] ?? '',
        labUploadBacteriaUploadFileName:
            json["lab_upload_bacteria_upload_file_name"] ?? '',
        labBacteriaCount: json["lab_bacteria_count"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "farmer_request_id": farmerRequestId,
        "farmer_id": farmerId,
        "farmer_select_lab": farmerSelectLab,
        "farmer_select_crop": farmerSelectCrop,
        "farmer_date_planted": farmerDatePlanted,
        "farmer_acres_land": farmerAcresLand,
        "farmer_lot_no": farmerLotNo,
        "farmer_harvest_date": farmerHarvestDate,
        "farmer_variety": farmerVariety,
        "farmer_gps_coordinates": farmerGpsCoordinates,
        "farmer_remarks": farmerRemarks,
        "farmer_request_datetime": farmerRequestDatetime,
        "lab_inspection_date": labInspectionDate,
        "lab_remarks": labRemarks,
        "lab_request_status": labRequestStatus,
        "lab_request_datetime": labRequestDatetime,
        "lab_upload_bacteria_select_lab": labUploadBacteriaSelectLab,
        "lab_upload_bacteria_select_planted_date":
            labUploadBacteriaSelectPlantedDate,
        "lab_upload_bacteria_select_crop": labUploadBacteriaSelectCrop,
        "lab_upload_bacteria_upload_file": labUploadBacteriaUploadFile,
        "lab_upload_bacteria_upload_file_name": labUploadBacteriaUploadFileName,
        "lab_bacteria_count": labBacteriaCount,
      };
}
