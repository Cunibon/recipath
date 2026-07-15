import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/domain_service/syncing_service/supabase_buckets.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/bucket_file_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/dark_mode_provider.dart';

import 'fixture_seeding.dart';

const _localStorageBackingFile =
    'storage-61f76cb0-842b-4318-a644-e245f50a0b5a.json';
const _fixtureImagesPath = 'test/screenshots/fixtures/images';

class ScreenshotWorld {
  ScreenshotWorld({
    required this.container,
    required this.db,
    required this.recipes,
    required this.groceries,
    required this.subscriptions,
  });

  final ProviderContainer container;
  final AppDatabase db;
  final List<RecipeData> recipes;
  final IMap<String, GroceryData> groceries;
  final List<ProviderSubscription<Object?>> subscriptions;

  RecipeData recipeByTitle(String title) =>
      recipes.firstWhere((recipe) => recipe.title.trim() == title);

  GroceryData groceryByName(String name) =>
      groceries.values.firstWhere((grocery) => grocery.name.trim() == name);
}

Future<ScreenshotWorld> setUpScreenshotWorld(
  WidgetTester tester, {
  bool fullyStocked = false,
}) async {
  final ScreenshotWorld world = (await tester.runAsync(() async {
    final appDir = await _setUpAppDirectory();
    await _initializeLocalStorage(appDir);
    await _copyFixtureImages(appDir);

    final db = AppDatabase(NativeDatabase.memory());
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWith((ref) => db),
        applicationPathProvider.overrideWith((ref) => appDir),
        supabaseUserProvider.overrideWithValue(null),
      ],
    );

    final seeded = await seedFixtureData(container, fullyStocked: fullyStocked);
    final subscriptions = await _warmUpProviders(container, seeded.recipes);

    return ScreenshotWorld(
      container: container,
      db: db,
      recipes: seeded.recipes,
      groceries: seeded.groceries,
      subscriptions: subscriptions,
    );
  }))!;

  addTearDown(() async {
    await tester.runAsync(() async {
      for (final subscription in world.subscriptions) {
        subscription.close();
      }
      world.container.dispose();
      await world.db.close();
    });
  });

  return world;
}

Future<Directory> _setUpAppDirectory() async {
  final appDir = await Directory.systemTemp.createTemp('recipath_shots');
  PathProviderPlatform.instance = _FakePathProvider(appDir.path);
  return appDir;
}

Future<void> _initializeLocalStorage(Directory appDir) async {
  File('${appDir.path}/$_localStorageBackingFile').writeAsStringSync('{}');
  await initLocalStorage();
  localStorage.clear();
  localStorage.setItem(LocaleNotifier.localKey, 'en');
  localStorage.set(DarkModeNotifier.darkModeKey, true);
  localStorage.set(
    '${QuickFilterNotifier.quickFilterDataKey}_${TagTypeEnum.grocery.name}',
    {QuickFilters.cluster.name: true},
  );
}

Future<void> _copyFixtureImages(Directory appDir) async {
  final imagesDir = Directory(_fixtureImagesPath);
  for (final file in imagesDir.listSync().whereType<File>()) {
    final copy = await file.copy(
      '${appDir.path}/${file.uri.pathSegments.last}',
    );
    await _preloadImage(copy);
  }
}

Future<List<ProviderSubscription<Object?>>> _warmUpProviders(
  ProviderContainer container,
  List<RecipeData> recipes,
) async {
  final subscriptions = <ProviderSubscription<Object?>>[
    container.listen(recipeProvider, (_, _) {}),
    container.listen(filteredGroceryProvider, (_, _) {}),
  ];
  await container.read(recipeProvider.future);
  await container.read(filteredGroceryProvider.future);

  for (final recipe in recipes) {
    final imageName = recipe.imageName;
    if (imageName == null) continue;
    final provider = bucketFileProvider(
      bucket: SupabaseBuckets.recipeImage,
      fileName: imageName,
    );
    subscriptions.add(container.listen(provider, (_, _) {}));
    await container.read(provider.future);
  }

  return subscriptions;
}

Future<void> _preloadImage(File file) {
  final completer = Completer<void>();
  final stream = FileImage(file).resolve(ImageConfiguration.empty);
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (image, synchronousCall) {
      completer.complete();
      stream.removeListener(listener);
    },
    onError: (error, stackTrace) {
      completer.complete();
      stream.removeListener(listener);
    },
  );
  stream.addListener(listener);
  return completer.future;
}

class _FakePathProvider extends PathProviderPlatform {
  _FakePathProvider(this.root);

  final String root;

  @override
  Future<String?> getApplicationDocumentsPath() async => root;

  @override
  Future<String?> getApplicationSupportPath() async => root;

  @override
  Future<String?> getTemporaryPath() async => root;
}
