import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/domain_service/syncing_service/download_data_extension.dart';
import 'package:recipe_list/domain_service/syncing_service/upload_data_extension.dart';
import 'package:recipe_list/repos/repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncingService {
  SyncingService({
    required this.groceryRepo,
    required this.recipeRepo,
    required this.shoppingRepo,
    required this.storageRepo,

    required this.supabaseClient,
  });
  final Repo<GroceryData> groceryRepo;
  final Repo<RecipeData> recipeRepo;
  final Repo<ShoppingData> shoppingRepo;
  final Repo<IngredientData> storageRepo;

  final SupabaseClient supabaseClient;

  static String storageKey = "lastSync";
  static String updatedAtKey = "updated_at";

  Timer? _timer;
  Completer syncRunning = Completer();

  late DateTime _lastSync;
  DateTime get lastSync => _lastSync;

  Future<void> start() async {
    await sync();

    final savedSync = localStorage.getItem(storageKey);
    if (savedSync != null) {
      _lastSync = DateTime.parse(savedSync);
    } else {
      _lastSync = DateTime.fromMicrosecondsSinceEpoch(0);
    }

    _timer = Timer(Duration(minutes: 1), () => sync());
  }

  Future<void> stop() async {
    _timer = null;
    await syncRunning.future;
  }

  Future<void> sync() async {
    _timer?.cancel();

    DateTime? latestDate;

    try {
      await upload();
      latestDate = await download();
    } finally {
      if (latestDate != null) {
        localStorage.setItem(storageKey, latestDate.toIso8601String());
        _lastSync = latestDate;
      }

      if (_timer != null) {
        _timer = Timer(Duration(minutes: 1), () => sync());
      }
      syncRunning.complete();
      syncRunning = Completer();
    }
  }
}
