import 'package:crop_yield/utils/app_utils.dart';
import 'package:crop_yield/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class SqliteController extends GetxController {
  static SqliteController get to => Get.find();
  final dbHelper = DBHelper();

  Future<bool> checkAndInsert(
      {required String tableName,
      required String paramName,
      required Map<String, dynamic> data}) async {
    // Define the condition to check if the data exists
    // Assuming 'id' is the primary key or unique column
    final Database db = await dbHelper.database;

    var id = data[paramName];
    var queryResult = await db.query(
      tableName,
      where: '$paramName = ?',
      whereArgs: [id],
    );

    // Check if data exists
    if (queryResult.isEmpty) {
      // Data does not exist, proceed with the insertion
      await db.insert(tableName, data);
      print('Data inserted');
      return true;
    } else {
      // Data already exists, skip the insertion
      print('Data already exists');
      return false;
    }
  }

  // Insert data into table
  Future<int> insertSqliteData(
      {required Map<String, dynamic> data, required String tableName}) async {
    try {
      // Access the database using the DBHelper instance
      final Database db = await dbHelper.database;

      // Perform the insert operation
      int result = await db.insert(
        tableName,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // If the insert returns a positive ID, it was successful
      // if (result > 0) {
      //   return true; // Insert successful
      // } else {
      //   return false; // Insert failed for some reason
      // }
      return result;
    } catch (e) {
      // Handle any errors that might occur
      showLogs("ERROR", "Error inserting user: $e");
      AppUtils.showToast("Error inserting user: $e");
      return 0; // Insert failed due to an exception
    }
  }

  // Fetch data into table
  Future<List<Map<String, dynamic>>> fetchSqliteData(
      {required String tableName}) async {
    final db = await dbHelper.database;
    return await db.query(tableName);
  }

  // Update a data
  Future<int> updateDateFromTable(
      {required Map<String, dynamic> data,
      required String tableName,
      required String id,
      required String columnName}) async {
    final db = await dbHelper.database;
    return await db.update(
      tableName,
      data,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>?> getDataById({
    required String tableName,
    required String id,
    required String columnName,
  }) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> results = await db.query(
      tableName,
      where: '$columnName = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null; // ID not found
    }
  }

// Delete a data from table
  Future<int> deleteDataFromTable(
      {required String id,
      required String tableName,
      required String columnName}) async {
    final db = await dbHelper.database;
    return await db.delete(
      tableName,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }
}
