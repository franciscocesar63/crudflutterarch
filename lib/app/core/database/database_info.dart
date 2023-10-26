import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'database_on_create.dart';

abstract class DatabaseInfo {
  Future<Database> get database;
}

class DatabaseInfoImpl extends DatabaseInfo {
  Database? _database;

  @override
  Future<Database> get database async {
    if (_database == null) return await _init();
    return _database!;
  }

  Future<Database> _init() async {
    final databasesPath = await getApplicationSupportDirectory();
    final path = p.join(databasesPath.path, 'data.db');
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: onCreate,
      ),
    );
  }
}
