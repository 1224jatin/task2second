import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task2/task_Model/taskSecond_Model.dart';

class DbHelper {
  static Database? _db;

  Future<DatabaseExecutor> get db async{
    if (db != null){
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(path,
    version: 1,
    onCreate: (db,version) async {
     await db.execute('''
     CREATE TABLE Task (
     id INTEGER PRIMARY KEY AUTOINCREMENT ,
     Name TEXT NOT NULL ,
     DATE INTEGER,
     DESCRIPTION TEXT)'''
     );
    }
    );
  }

  Future<void> insertData(Task  task) async{
     final db = await _db ;
     await db?.insert('Task', task.toMap());

  }
}