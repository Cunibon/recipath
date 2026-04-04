import 'package:recipath/repos/abstract/local_repo.dart';

abstract class TagFilteredRepo<T> extends LocalRepo<T> {
  TagFilteredRepo(super.db);

  Stream<Map<String, T>> streamFiltered(Set<String> tagDataFilters);
}
