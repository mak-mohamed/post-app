import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDataLocal {
  static const _databaseName = "UserMbook.db";
  // ignore: prefer_const_declarations
  static final _databaseVersion = 1;
  static const table = 'Posts_table';

  static const columnId = 'id';
  static const columnUserUsername = 'userName';
  static const columnEmail = 'useremail';
  static const columnpassword = 'userpassword';

  UserDataLocal._privateConstructor();
  static final UserDataLocal instance = UserDataLocal._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUserUsername TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnpassword TEXT
           )
          ''');
  }

  Future<int> insertUser(
      {required String username,
      required String useremail,
      required String userpassword}) async {
    Database db = await instance.database;
    print('on insert');
    return await db.insert(table, {
      'userName': username,
      'useremail': useremail,
      'userpassword': userpassword
    });
  }

  Future<List> getAllUser() async {
    Database db = await instance.database;
   List list = await db.query(table);
    print('on get all post ');
   return list  ;
  }

 // Future<int> deleteusers() async {
 //   print('on delete');
 //   Database db = await instance.database;
 //   return await db.delete(table);
 // }
}
