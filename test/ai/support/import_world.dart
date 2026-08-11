import 'dart:convert';
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

const _localStorageBackingFile =
    'storage-61f76cb0-842b-4318-a644-e245f50a0b5a.json';

class ImportWorld {
  ImportWorld({
    required this.container,
    required this.db,
    required this.groceries,
    required this.recipeTags,
    required this.subscriptions,
  });

  final ProviderContainer container;
  final AppDatabase db;
  final IMap<String, GroceryData> groceries;
  final IMap<String, TagData> recipeTags;
  final List<ProviderSubscription<Object?>> subscriptions;

  Set<String> get groceryNames =>
      groceries.values.map((grocery) => grocery.name.trim()).toSet();

  Set<String> get recipeTagNames =>
      recipeTags.values.map((tag) => tag.name.trim()).toSet();

  Future<void> dispose() async {
    for (final subscription in subscriptions) {
      subscription.close();
    }
    container.dispose();
    await db.close();
  }
}

Future<ImportWorld> setUpImportWorld({
  required AiProviderEnum provider,
  required String token,
}) async {
  final appDir = await Directory.systemTemp.createTemp('recipath_ai');
  PathProviderPlatform.instance = _FakePathProvider(appDir.path);

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
        () => _StubAiProvider(
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

class _StubAiProvider extends AiProviderNotifier {
  _StubAiProvider(this._data);

  final AiProviderData _data;

  @override
  Future<AiProviderData?> build() async => _data;
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

class RecipePageServer {
  RecipePageServer._(this._server);

  final HttpServer _server;

  String get url => 'http://127.0.0.1:${_server.port}/recipe';

  static Future<RecipePageServer> serve(String plainTextRecipe) =>
      serveHtml(_asHtml(plainTextRecipe));

  static Future<RecipePageServer> serveHtml(String body) async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);

    server.listen((request) async {
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.html
        ..write(body);
      await request.response.close();
    });

    return RecipePageServer._(server);
  }

  Future<void> stop() => _server.close(force: true);

  static String _asHtml(String plainTextRecipe) {
    final escaped = const HtmlEscape().convert(plainTextRecipe);
    return '''
<!doctype html>
<html><head><title>Recipe</title>
<script>window.analytics = {track: function () {}};</script>
<style>body { font-family: sans-serif; }</style>
</head>
<body>
<nav>Home / Recipes</nav>
<article><pre>$escaped</pre></article>
<footer>Copyright</footer>
</body></html>
''';
  }
}
