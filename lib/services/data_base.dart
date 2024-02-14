import 'dart:async';
import 'dart:io';
import 'package:pack_wise/models/box.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String boxTable = 'box_table';
  String colId = 'id';
  String colName = 'name';
  String colDescription = 'description';
  String colDate = 'date';
  String colObjects = 'objects';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = p.join(directory.path, 'boxes.db');
    var boxesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return boxesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $boxTable($colId TEXT PRIMARY KEY, $colName TEXT, $colDescription TEXT, $colDate TEXT, $colObjects TEXT)');
  }

  // CRUD Operations

  Future<int> insertBox(Box box) async {
    Database db = await database;
    var result = await db.insert(boxTable, box.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getBoxMapList() async {
    Database db = await database;
    var result = await db.query(boxTable);
    return result;
  }

  Future<List<Box>> getBoxList() async {
    var boxMapList = await getBoxMapList();
    int count = boxMapList.length;
    List<Box> boxList = [];
    for (int i = 0; i < count; i++) {
      boxList.add(Box.fromMap(boxMapList[i]));
    }
    return boxList;
  }

  Future<int> deleteBox(String id) async {
    Database db = await database;
    return await db.delete(
      boxTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }
}
