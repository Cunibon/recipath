import 'dart:io';

import 'package:drift/native.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_by_type_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';

import '../../screenshots/fixture_seeding.dart';
import 'fake_path_provider.dart';
import 'stub_ai_provider.dart';

class ImportWorld {
  ImportWorld({
    required this.container,
    required this.db,
    required this.groceries,
    required this.recipeTags,
    required this.subscriptions,
  });

  static const _localStorageBackingFile =
      'storage-61f76cb0-842b-4318-a644-e245f50a0b5a.json';

  final ProviderContainer container;
  final AppDatabase db;
  final IMap<String, GroceryData> groceries;
  final IMap<String, TagData> recipeTags;
  final List<ProviderSubscription<Object?>> subscriptions;

  Set<String> get groceryNames =>
      groceries.values.map((grocery) => grocery.name.trim()).toSet();

  Set<String> get recipeTagNames =>
      recipeTags.values.map((tag) => tag.name.trim()).toSet();

  static Future<ImportWorld> create({
    required AiProviderEnum provider,
    required String token,
  }) async {
    final appDir = await Directory.systemTemp.createTemp('recipath_ai');
    PathProviderPlatform.instance = FakePathProvider(appDir.path);

    File('${appDir.path}/$_localStorageBackingFile').writeAsStringSync('{}');
    await initLocalStorage();
    localStorage.clear();
    localStorage.setItem(LocaleNotifier.localKey, 'en');

    final db = AppDatabase(NativeDatabase.memory());
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWith((ref) => db),
        applicationPathProvider.overrideWith((ref) => appDir),
        supabaseUserProvider.overrideWithValue(null),
        aiProviderProvider.overrideWith(
          () => StubAiProvider(
            AiProviderData(token: token, provider: provider),
          ),
        ),
      ],
    );

    final subscriptions = <ProviderSubscription<Object?>>[
      container.listen(groceryProvider, (_, _) {}),
      container.listen(tagProvider, (_, _) {}),
    ];

    await seedFixtureData(container, fullyStocked: false);
    final groceries = await container.read(groceryProvider.future);
    final typedTags = await container.read(tagByTypeProvider.future);

    return ImportWorld(
      container: container,
      db: db,
      groceries: groceries,
      recipeTags: typedTags[TagTypeEnum.recipe]!,
      subscriptions: subscriptions,
    );
  }

  Future<void> dispose() async {
    for (final subscription in subscriptions) {
      subscription.close();
    }
    container.dispose();
    await db.close();
  }
}
