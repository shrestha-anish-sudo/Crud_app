import 'dart:io';
import 'package:crud_app/Models/Note_models.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db = null;
  DatabaseHelper._instance();

  String noteTable = 'notetable';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'Priority';
  String colStatus = 'Status';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todoListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT ,$colTitle TEXT, $colDate TEXT,$colPriority TEXT. $colStatus INTEGER )');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(noteTable);
    return result;
  }

  Future<List<Note>> getNoteList() async {
    final List<Map<String, dynamic>> noteMapList = await getNoteMapList();
    final List<Note> noteList = [];
    noteMapList.forEach((notemap) {
      noteList.add(Note.fromMap(notemap));
    });
  }
}
