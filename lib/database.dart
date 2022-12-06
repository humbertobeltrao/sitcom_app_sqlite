import 'package:pet_modulo_02/sitcom.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'sitcoms.db'),
      //Android -> /sitcoms.db
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE Sitcoms(id INTEGER PRIMARY KEY AUTOINCREMENT, sitcomName TEXT NOT NULL, sitcomStreamingService TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  //INSERT
  Future<void> insertSitcom(Sitcom sitcom) async {
    final db = await initializeDB();
    await db.insert('Sitcoms', sitcom.toMap());
  }

  //SELECT/LIST
  Future<List<Sitcom>> listSitcoms() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('Sitcoms');
    return List.generate(result.length, (index) {
      return Sitcom(
        sitcomName: result[index]['sitcomName'],
        sitcomStreamingService: result[index]['sitcomStreamingService'],
      );
    });
  }

  //UPDATE
  /** TO DO */

  //DELETE
  /** TO DO */
}
