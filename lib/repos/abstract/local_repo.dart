import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/repos/abstract/repo.dart';

abstract class LocalRepo<T> extends Repo {
  LocalRepo(super.db);

  Future<IMap<String, T>> get();
  Stream<IMap<String, T>> stream();
  Future<void> add(T newData);
  Future<void> delete(String id);
  Future<void> clear();

  Stream<bool> hasNotUploaded();
}
