import 'package:crop_yield/sqlite_data/sqlite_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  // Step 1: Private constructor to enforce singleton pattern
  DBHelper._internal();

  // Step 2: The singleton instance
  static final DBHelper _instance = DBHelper._internal();

  // Step 3: Factory constructor to return the same instance
  factory DBHelper() => _instance;

  // Step 4: Database object
  Database? _database;

  // Step 5: Non-static getter for database initialization
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the database asynchronously if it's not already
    _database = await _initDB();
    return _database!;
  }

  // Step 6: Database initialization logic (asynchronous)
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), SqliteConstants.dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Step 7: Table creation logic (asynchronous)
  Future _onCreate(Database db, int version) async {
    await db.execute(SqliteConstants.createFarmerRequestTable);
    await db.execute(SqliteConstants.createLoginTable);
  }
}
