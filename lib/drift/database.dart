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
import 'package:recipath/drift/tables/grocery_tag_table.dart';
import 'package:recipath/drift/tables/ingredient_table.dart';
import 'package:recipath/drift/tables/quick_shopping_table.dart';
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
    GroceryTagTable,
    ShoppingTable,
    QuickShoppingTable,
    StorageTable,
    RecipeStatisticTable,
    RecipeShoppingTable,
    FileTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 18;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
    onUpgrade: (m, from, to) async {
      if (from < 13) {
        await m.addColumn(recipeTable, recipeTable.parent);
      }
      if (from < 14) {
        await m.addColumn(recipeStepTable, recipeStepTable.minutes);
      }
      if (from < 15) {
        await m.addColumn(ingredientTable, ingredientTable.uploaded);
      }
      if (from < 16) {
        await m.addColumn(tagTable, tagTable.tagType);
      }
      if (from < 17) {
        await m.createTable(groceryTagTable);
      }
      if (from < 18) {
        await m.createTable(quickShoppingTable);
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
