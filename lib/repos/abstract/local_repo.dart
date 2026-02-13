import 'package:recipath/repos/abstract/repo.dart';

abstract class LocalRepo<T> extends Repo {
  LocalRepo(super.db);

  Future<Map<String, T>> get();
  Stream<Map<String, T>> stream();
  Future<void> add(T newData);
  Future<void> delete(String id);
  Future<void> clear();
}
