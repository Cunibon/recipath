@Tags(['live'])
library;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:recipath/helper/ref_extension.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_mutation.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_content_extractor.dart';

import 'support/import_world.dart';
import 'support/invariants.dart';
import 'support/recipe_card.dart';
import 'support/recipe_page_server.dart';
import 'support/tokens.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  final allowedUnits = allowedUnitsFromAsset();
  final sampleRecipe = File(
    'test/ai/fixtures/sample_recipe.txt',
  ).readAsStringSync();
  final sampleJsonLdPage = File(
    'test/ai/fixtures/sample_recipe_jsonld.html',
  ).readAsStringSync();
  final realPhoto = File('test/ai/fixtures/sample_recipe.jpg');
  final Uint8List recipeImage = realPhoto.existsSync()
      ? realPhoto.readAsBytesSync()
      : renderRecipeCard(sampleRecipe);

  group('RecipeContentExtractor', () {
    test('prefers JSON-LD over page text', () async {
      final server = await RecipePageServer.serveHtml(sampleJsonLdPage);
      addTearDown(server.stop);

      final extracted = await RecipeContentExtractor.extract(server.url);

      expect(extracted, startsWith('Structured recipe data (JSON-LD):'));
      expect(extracted, contains('Honey Garlic Chicken Stir-Fry'));
      expect(
        extracted,
        isNot(contains('Advertisement')),
        reason: 'page chrome leaked in, so the JSON-LD branch did not fire',
      );
    });

    test('falls back to page text when there is no JSON-LD', () async {
      final server = await RecipePageServer.serve(sampleRecipe);
      addTearDown(server.stop);

      final extracted = await RecipeContentExtractor.extract(server.url);

      expect(extracted, isNot(startsWith('Structured recipe data')));
      expect(extracted, contains('Honey Garlic Chicken Stir-Fry'));
      expect(
        extracted,
        isNot(contains('window.analytics')),
        reason: 'script contents were not stripped',
      );
    });
  });

  for (final provider in AiProviderEnum.values) {
    final token = Tokens.of(provider);
    final skip = Tokens.skipReason(provider);

    group('${provider.displayName} (${provider.defaultModel})', () {
      late ImportWorld world;

      setUp(() async {
        if (token == null) return;
        world = await ImportWorld.create(provider: provider, token: token);
      });

      tearDown(() async {
        if (token == null) return;
        await world.dispose();
      });

      Future<void> check(Future<Map<String, dynamic>?> run) async {
        final stopwatch = Stopwatch()..start();
        final result = await run;
        stopwatch.stop();

        expect(result, isNotNull, reason: 'mutation returned no result');
        printOnFailure(const JsonEncoder.withIndent('  ').convert(result));

        assertRecipeImportInvariants(result!, allowedUnits: allowedUnits);
        assertExistingGroceriesReused(result, world.groceryNames);
        assertExistingTagsReused(result, world.recipeTagNames);

        stdout.writeln(
          '  ${summarize(result, existingGroceryNames: world.groceryNames, existingTagNames: world.recipeTagNames)} '
          'in ${stopwatch.elapsed.inMilliseconds}ms',
        );
      }

      test(
        'url import',
        () async {
          final server = await RecipePageServer.serve(sampleRecipe);
          addTearDown(server.stop);

          await check(
            world.container.run(
              (tsx) => AiImportMutation.runUrlPrompt(tsx, server.url),
            ),
          );
        },
        skip: skip,
        timeout: const Timeout(Duration(minutes: 3)),
      );

      test(
        'url import (json-ld)',
        () async {
          final server = await RecipePageServer.serveHtml(sampleJsonLdPage);
          addTearDown(server.stop);

          await check(
            world.container.run(
              (tsx) => AiImportMutation.runUrlPrompt(tsx, server.url),
            ),
          );
        },
        skip: skip,
        timeout: const Timeout(Duration(minutes: 3)),
      );

      test(
        'image import',
        () async {
          await check(
            world.container.run(
              (tsx) => AiImportMutation.runImagePrompt(tsx, recipeImage),
            ),
          );
        },
        skip: provider.multimodal ? skip : 'provider is not multimodal',
        timeout: const Timeout(Duration(minutes: 3)),
      );
    });
  }
}
