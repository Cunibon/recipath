import 'package:recipe_list/repos/repo.dart';

abstract class SyncRepo<T> extends Repo<T> {
  SyncRepo(super.db);

  Future<Map<String, T>> getNotUploaded();
}
