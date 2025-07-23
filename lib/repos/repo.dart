import 'package:drift/drift.dart';
import 'package:recipe_list/drift/database.dart';

abstract class Repo<T> {
  Repo(this.db);
  final AppDatabase db;

  ResultSetImplementation get table;
  Query get query;

  Future<Map<String, T>> get();
  Stream<Map<String, T>> stream();
  Future<void> add(T newData);
  Future<void> delete(String id);
  Future<void> clear();
}
