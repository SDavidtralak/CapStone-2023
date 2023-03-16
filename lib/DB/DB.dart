// ignore_for_file: unused_local_variable, prefer_const_declarations, unnecessary_new
import 'dart:io' as io;
import 'dart:async';

import 'package:capstone_project/model/liftcitl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/retry.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Construct the path to the app's writable database file:
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "capstone-liftcitl.db");
    bool dbExist = await io.File(path).exists();
    if (!dbExist) {
      ByteData data =
          await rootBundle.load(join("assets", "capstone-liftcitl.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(path).writeAsBytes(bytes, flush: true);
    }
    var theDb = await openDatabase(path, version: 1);
    return theDb;
  }

  Future<List<String>> getExerciseName() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient!.rawQuery('select Exercise_name from Exercise_tbl');
    List<String> names = [];
    for (int i = 0; i < list.length; i++) {
      names.add(list[i]['Exercise_name']);
    }
    return names;
  }

  Future<List<String>> getWorkoutName() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient!.rawQuery('select Workout_name from Workout_tbl');
    List<String> names = [];
    for (int i = 0; i < list.length; i++) {
      names.add(list[i]['Workout_name']);
    }
    return names;
  }

  Future<List<Exercise>> getExercise() async {
    var dbClient = await db;

    List<Map> list = await dbClient!.rawQuery('select * from exercise_tbl');
    List<Exercise> exercises = [];
    for (int i = 0; i < list.length; i++) {
      exercises.add(new Exercise(
        list[i]['Exercise_name'],
        list[i]['Exercise_Reps'],
        list[i]['Exercise_desc'],
        list[i]['Exercise_muscle_group'],
      ));
    }
    return exercises;
  }
}
