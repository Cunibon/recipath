import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/recipe_table.dart';
import 'package:recipath/drift/tables/tag_table.dart';

@TableIndex(name: 'recipeTag_uploaded', columns: {#uploaded})
class RecipeTagTable extends Table {
  @override
  Set<Column> get primaryKey => {recipeId, tagId};

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get tagId =>
      text().references(TagTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
