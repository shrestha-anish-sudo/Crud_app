import 'dart:io';

import 'package:crud_app/Models/Note_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// DatabaseHelper class for handling SQLite database operations
class DatabaseHelper {
  // Singleton instance of DatabaseHelper

  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db = null;
  // Private constructor for singleton pattern

  DatabaseHelper._instance();

  String noteTable = 'notetable';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'Priority';
  String colStatus = 'Status';

  // Getter for the database instance
  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }
  // Initialize the database

  Future<Database> _initDb() async {
    // Get the application directory

    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    //open databse
    final todoListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDB;
  }

//create database table
  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT ,$colTitle TEXT, $colDate TEXT,$colPriority TEXT. $colStatus INTEGER )');
  }

//Retireve List of note as Map
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(noteTable);
    return result;
  }

  //Retrieve list of notes
  Future<List<Note>> getNoteList() async {
    final List<Map<String, dynamic>> noteMapList = await getNoteMapList();
    final List<Note> noteList = [];
    noteMapList.forEach((notemap) {
      noteList.add(Note.fromMap(notemap));
    });
    noteList.sort((noteA, noteB) => noteA.date!.compareTo(noteB.date!));
    return noteList;
  }

//Insert new note into database
  Future<int> insertNote(Note note) async {
    Database? db = await this.db;
    final int result = await db!.update(
      noteTable,
      note.toMap(),
      where: '$colId',
      whereArgs: [note.id],
    );
    return result;
  }

//update
  Future<int> updateNote(Note note) async {
    Database? db = await this.db;
    final int result = await db!.update(
      noteTable,
      note.toMap(),
      where: '$colId',
      whereArgs: [note.id],
    );
    return result;
  }

//delete
  Future<int> deleteNote(Note note) async {
    Database? db = await this.db;
    final int result = await db!.delete(
      noteTable,
      where: '$colId',
      whereArgs: [note.id],
    );
    return result;
  }
}
