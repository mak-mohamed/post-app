import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PostDataLocal {
  static const _databaseName = "postsMbook.db";
  // ignore: prefer_const_declarations
  static final _databaseVersion = 1;
  static const table = 'Posts_table';

  static const columnId = 'id';
  static const columnUserId = 'userId';
  static const columnTitle = 'title';
  static const columnBody = 'body';

  PostDataLocal._privateConstructor();
  static final PostDataLocal instance = PostDataLocal._privateConstructor();

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
            $columnUserId INTEGER NOT NULL,
            $columnTitle TEXT NOT NULL,
            $columnBody TEXT NOT NULL
           )
          ''');
  }

  Future<int> insertPosts({required PostModel postModel}) async {
    Database db = await instance.database;
       print('on insert') ;
    return await db.insert(table, {
      'id': postModel.id,
      'userId': postModel.userId,
      'title': postModel.title,
      'body': postModel.body
    });
  }
    Future<List<PostModel>> getAllPosts() async {
    Database db = await instance.database;
    
    List list =  await db.query(table);
      print('on get all post ') ;
    return  list.map((e) => PostModel.fromJson(e)).toList() ;


  }



    Future<int> deletePOsts() async {
      print('on delete') ;
    Database db = await instance.database;
    return await db.delete(table);
  }
}
