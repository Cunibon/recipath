import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:genkit/genkit.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/helper/ref_extension.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/providers/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_exception.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_content_extractor.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_prompt_builder.dart';

abstract class AiImportMutation {
  static final mutation = Mutation();

  static Future<void> import({
    required MutationTarget ref,
    required Map<String, dynamic> result,
  }) => ref.run((tsx) async {
    final appDirectory = tsx.get(applicationPathProvider);

    final newFileName = randomAlphaNumeric(16);
    final file = File("${appDirectory.path}/$newFileName");

    await file.writeAsString(jsonEncode(result));

    tsx
        .get(goRouterProvider)
        .go(
          "${RootRoutes.importRoute.path}/${ImportRoutes.recipeImport.path}",
          extra: file.path,
        );
  });

  static Future<void> runImageImport(MutationTarget ref, Uint8List image) =>
      mutation.run(ref, (transaction) async {
        final result = await runImagePrompt(transaction, image);
        if (result != null) {
          await import(ref: ref, result: result);
        }
      });

  static Future<Map<String, dynamic>?> runImagePrompt(
    MutationTransaction tsx,
    Uint8List image,
  ) async {
    final prompt = await RecipePromptBuilder.build(tsx);
    if (prompt == null) return null;

    return _runPrompt(prompt, [
      TextPart(
        text:
            "Extract the recipe from this image, including all ingredients and steps.",
      ),
      MediaPart(
        media: Media(
          contentType: 'image/jpeg',
          url: 'data:image/jpeg;base64,${base64Encode(image)}',
        ),
      ),
    ]);
  }

  static Future<void> runUrlImport(MutationTarget ref, String url) =>
      mutation.run(ref, (transaction) async {
        final result = await runUrlPrompt(transaction, url);
        if (result != null) {
          await import(ref: ref, result: result);
        }
      });

  static Future<Map<String, dynamic>?> runUrlPrompt(
    MutationTransaction tsx,
    String url,
  ) async {
    final prompt = await RecipePromptBuilder.build(tsx);
    if (prompt == null) return null;

    final String recipeContent;
    try {
      recipeContent = await RecipeContentExtractor.extract(url);
    } catch (e) {
      throw AiImportException.classifyUrlError(e);
    }

    return _runPrompt(prompt, [
      TextPart(
        text:
            "Extract the recipe from the following content:\n\n$recipeContent",
      ),
    ]);
  }

  static Future<Map<String, dynamic>> _runPrompt(
    RecipePrompt prompt,
    List<Part> userContent,
  ) async {
    final GenerateResponseHelper result;
    try {
      result = await prompt.backend.generate(
        systemPrompt: prompt.systemPrompt,
        userContent: userContent,
        outputSchema: prompt.outputSchema,
      );
    } catch (e) {
      throw AiImportException.classify(e);
    }

    try {
      return _parseResult(result);
    } catch (e) {
      throw AiImportException(AiImportErrorType.parseError, e);
    }
  }

  static Map<String, dynamic> _parseResult(GenerateResponseHelper result) {
    final args = result.jsonOutput as Map<String, dynamic>?;
    if (args == null) return {};

    final recipes = (args['recipes'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final groceries = (args['groceries'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final recipeTags = (args['recipeTags'] as List? ?? [])
        .cast<Map<String, dynamic>>();

    final groceryData = <String, dynamic>{};
    final groceryIdsByName = <String, List<String>>{};
    for (final grocery in groceries) {
      final id = grocery['id'] as String?;
      if (id == null) continue;
      grocery['normalAmount'] = 1;
      groceryData[id] = grocery;

      final name = (grocery['name'] as String?)?.trim().toLowerCase();
      if (name == null || name.isEmpty) continue;
      groceryIdsByName.putIfAbsent(name, () => []).add(id);
    }

    final recipeData = <String, dynamic>{};
    for (final recipe in recipes) {
      final id = recipe['id'] as String?;
      if (id != null) recipeData[id] = recipe;

      final steps = recipe['steps'] as List? ?? const [];
      for (final step in steps.cast<Map<String, dynamic>>()) {
        final ingredients = step['ingredients'] as List? ?? const [];
        for (final ingredient in ingredients.cast<Map<String, dynamic>>()) {
          final reference = ingredient['groceryId'] as String?;
          if (reference == null || groceryData.containsKey(reference)) continue;

          final matches = groceryIdsByName[reference.trim().toLowerCase()];
          if (matches != null && matches.length == 1) {
            ingredient['groceryId'] = matches.single;
          }
        }
      }
    }

    final tagData = <String, dynamic>{};
    for (final recipeTag in recipeTags) {
      final recipeId = recipeTag['recipeId'] as String?;
      final tags = recipeTag['tags'] as List?;
      if (recipeId != null && tags != null) {
        tagData[recipeId] = tags.map((e) => e..["tagType"] = "Recipe").toList();
      }
    }

    return {
      'recipeData': recipeData,
      'groceryData': groceryData,
      'tagData': tagData,
    };
  }
}
