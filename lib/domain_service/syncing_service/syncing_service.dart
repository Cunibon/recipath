import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/domain_service/syncing_service/download_data_extension.dart';
import 'package:recipe_list/domain_service/syncing_service/upload_data_extension.dart';
import 'package:recipe_list/repos/sync_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncingService {
  SyncingService({
    required this.groceryRepo,
    required this.recipeRepo,
    required this.shoppingRepo,
    required this.storageRepo,

    required this.supabaseClient,
  });
  final logger = Logger();

  final SyncRepo<GroceryData> groceryRepo;
  final SyncRepo<RecipeData> recipeRepo;
  final SyncRepo<ShoppingData> shoppingRepo;
  final SyncRepo<StorageData> storageRepo;

  final SupabaseClient supabaseClient;

  bool get _loggedIn => supabaseClient.auth.currentUser != null;

  static String storageKey = "lastSync";
  static String updatedAtKey = "updated_at";

  Timer? _timer;
  Completer syncRunning = Completer();

  late DateTime _lastSync;
  DateTime get lastSync => _lastSync;

  Future<void> start() async {
    final savedSync = localStorage.getItem(storageKey);
    if (savedSync != null) {
      _lastSync = DateTime.parse(savedSync);
    } else {
      _lastSync = DateTime.fromMicrosecondsSinceEpoch(0);
    }

    _timer = Timer(Duration(minutes: 1), () => sync());

    await sync();
  }

  Future<void> stop() async {
    final previousTimer = _timer;
    _timer = null;

    if (previousTimer?.isActive == true) {
      _timer?.cancel();
    } else {
      await syncRunning.future;
    }
  }

  Future<void> reset() async {
    await stop();
    localStorage.removeItem(storageKey);
    await start();
  }

  Future<void> sync() async {
    _timer?.cancel();

    DateTime? latestDate;

    final stopwatch = Stopwatch()..start();

    int? uploaded;
    int? downloaded;

    try {
      if (_loggedIn) {
        uploaded = await upload();
        final downloadResult = await download();
        downloaded = downloadResult.downloadCount;
        latestDate = downloadResult.downloadTime;
      }
    } catch (e, s) {
      logger.e("Sync failed", error: e, stackTrace: s);
    } finally {
      stopwatch.stop();
      logger.i(
        "Sync took: ${stopwatch.elapsed}\nUploaded: $uploaded | Downloaded: $downloaded",
      );

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
