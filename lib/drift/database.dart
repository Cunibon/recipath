import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:recipe_list/drift/tables/grocery_table.dart';
import 'package:recipe_list/drift/tables/ingredient_table.dart';
import 'package:recipe_list/drift/tables/recipe_step_ingredient_table.dart';
import 'package:recipe_list/drift/tables/recipe_step_table.dart';
import 'package:recipe_list/drift/tables/recipe_table.dart';
import 'package:recipe_list/drift/tables/shopping_table.dart';
import 'package:recipe_list/drift/tables/storage_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    RecipeTable,
    RecipeStepTable,
    RecipeStepIngredientTable,
    IngredientTable,
    GroceryTable,
    ShoppingTable,
    StorageTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    // beforeOpen: (details) async {
    //   await customStatement('PRAGMA foreign_keys = ON;');
    // },
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
}
