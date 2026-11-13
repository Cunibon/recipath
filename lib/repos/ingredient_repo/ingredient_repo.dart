import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/repos/abstract/repo.dart';

abstract class IngredientRepo extends Repo {
  IngredientRepo(super.db);

  Stream<ISet<String>> streamUsedGroceryIds();
}
