import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';

abstract class Repo<T> {
  Repo(this.db);
  final AppDatabase db;

  ResultSetImplementation get table;
  Query get baseQuery;

  Future<Map<String, T>> get();
  Stream<Map<String, T>> stream();
  Future<void> add(T newData);
  Future<void> delete(T toDelete);
  Future<void> clear();
}
