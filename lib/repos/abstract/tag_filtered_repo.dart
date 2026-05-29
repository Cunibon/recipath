import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

abstract class TagFilteredRepo<T> extends LocalRepo<T> {
  TagFilteredRepo(super.db);

  Stream<IMap<String, T>> streamFiltered(Set<String> tagDataFilters);
}
