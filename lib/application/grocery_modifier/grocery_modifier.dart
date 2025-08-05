import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/repos/repo.dart';

class GroceryModifier {
  GroceryModifier(this.repo);
  final Repo<GroceryData> repo;

  Future<void> add(GroceryData newData) =>
      repo.add(newData.copyWith(uploaded: false));

  Future<void> delete(GroceryData toDelete) => repo.delete(toDelete.id);
}
