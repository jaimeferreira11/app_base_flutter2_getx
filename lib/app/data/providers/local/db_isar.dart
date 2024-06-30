import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBIsar {
  late Future<Isar> db;

  DBIsar() {
    db = openDB();
  }

  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      // agregar los schemas que se generen
      return await Isar.open([], inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
