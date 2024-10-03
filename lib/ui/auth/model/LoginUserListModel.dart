import '../../../sqlite_data/sqlite_constants.dart';

class LoginUserListModel {
  int user_id;
  String user_type;
  String user_name;
  String user_password;
  String user_active;

  LoginUserListModel({
    required this.user_id,
    required this.user_type,
    required this.user_name,
    required this.user_password,
    required this.user_active,
  });

  factory LoginUserListModel.fromJson(Map<String, dynamic> json) =>
      LoginUserListModel(
        user_id: json[SqliteConstants.user_id] ?? 0,
        user_type: json[SqliteConstants.user_type] ?? "",
        user_name: json[SqliteConstants.user_name] ?? "",
        user_password: json[SqliteConstants.user_password] ?? "",
        user_active: json[SqliteConstants.user_active] ?? "",
      );

  Map<String, dynamic> toJson() => {
        SqliteConstants.user_id: user_id,
        SqliteConstants.user_type: user_type,
        SqliteConstants.user_name: user_name,
        SqliteConstants.user_password: user_password,
        SqliteConstants.user_active: user_active,
      };
}
