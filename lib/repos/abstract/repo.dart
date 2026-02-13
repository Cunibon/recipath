import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';

abstract class Repo {
  Repo(this.db);
  final AppDatabase db;

  ResultSetImplementation get table;
  Query get baseQuery;

  Future<List<DataClass>> getNotUploaded();
}
