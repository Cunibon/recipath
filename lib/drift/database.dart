import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:recipath/drift/tables/file_table.dart';
import 'package:recipath/drift/tables/grocery_table.dart';
import 'package:recipath/drift/tables/ingredient_table.dart';
import 'package:recipath/drift/tables/recipe_shopping_table.dart';
import 'package:recipath/drift/tables/recipe_statistic_table.dart';
import 'package:recipath/drift/tables/recipe_step_ingredient_table.dart';
import 'package:recipath/drift/tables/recipe_step_table.dart';
import 'package:recipath/drift/tables/recipe_table.dart';
import 'package:recipath/drift/tables/recipe_tag_table.dart';
import 'package:recipath/drift/tables/shopping_table.dart';
import 'package:recipath/drift/tables/storage_table.dart';
import 'package:recipath/drift/tables/tag_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    RecipeTable,
    RecipeStepTable,
    RecipeStepIngredientTable,
    IngredientTable,
    GroceryTable,
    TagTable,
    RecipeTagTable,
    ShoppingTable,
    StorageTable,
    RecipeStatisticTable,
    RecipeShoppingTable,
    FileTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 11;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(recipeTable, recipeTable.archived);
        await m.createTable(recipeStatisticTable);
      }
      if (from < 3) {
        await m.addColumn(groceryTable, groceryTable.kcal);
      }
      if (from < 4) {
        await m.addColumn(groceryTable, groceryTable.fat);
        await m.addColumn(groceryTable, groceryTable.carbs);
        await m.addColumn(groceryTable, groceryTable.protein);
        await m.addColumn(groceryTable, groceryTable.fiber);
      }
      if (from < 5) {
        await m.addColumn(recipeTable, recipeTable.servings);
      }
      if (from < 6) {
        await m.createTable(recipeShoppingTable);
      }
      if (from < 7) {
        await m.addColumn(groceryTable, groceryTable.uploaded);
        await m.addColumn(recipeShoppingTable, recipeShoppingTable.uploaded);
        await m.addColumn(recipeStatisticTable, recipeStatisticTable.uploaded);
        await m.addColumn(
          recipeStepIngredientTable,
          recipeStepIngredientTable.uploaded,
        );
        await m.addColumn(recipeStepTable, recipeStepTable.uploaded);
        await m.addColumn(recipeTable, recipeTable.uploaded);
        await m.addColumn(shoppingTable, shoppingTable.uploaded);
        await m.addColumn(storageTable, storageTable.uploaded);
      }
      if (from < 8) {
        await m.addColumn(groceryTable, groceryTable.archived);
        await m.addColumn(shoppingTable, shoppingTable.deleted);
        await m.addColumn(storageTable, storageTable.deleted);
      }
      if (from < 9) {
        await m.createTable(fileTable);
      }
      if (from < 10) {
        await m.addColumn(groceryTable, groceryTable.barcode);
      }
      if (from < 11) {
        await m.addColumn(recipeStatisticTable, recipeStatisticTable.servings);
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }

  static Future<DriftIsolate> createIsolate() async {
    final token = RootIsolateToken.instance!;
    return await DriftIsolate.spawn(() {
      BackgroundIsolateBinaryMessenger.ensureInitialized(token);

      return LazyDatabase(() async {
        final dbFolder = await getApplicationSupportDirectory();
        final path = p.join(dbFolder.path, 'app.db');

        return NativeDatabase(File(path));
      });
    });
  }

  Future<void> clear() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
    await customStatement('PRAGMA foreign_keys = ON');
  }
}
