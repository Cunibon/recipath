import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:langchain/langchain.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_exception.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_content_extractor.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_prompt_builder.dart';

abstract class AiImportMutation {
  static final mutation = Mutation<Map<String, dynamic>?>();

  static Future<Map<String, dynamic>?> runImageImport(
    MutationTarget ref,
    Uint8List image,
  ) => mutation.run(ref, (tsx) async {
    final model = await RecipePromptBuilder.build(tsx);
    if (model == null) return null;

    final ChatResult result;
    try {
      result = await model.invoke({
        'input': [
          ChatMessageContent.text(
            "Extract the recipe from this image, including all ingredients and steps.",
          ),
          ChatMessageContent.image(
            data: base64Encode(image),
            mimeType: 'image/jpeg',
          ),
        ],
      });
    } catch (e) {
      throw AiImportException.classify(e);
    }

    try {
      return _parseResult(result);
    } catch (e) {
      throw AiImportException(AiImportErrorType.parseError, e);
    }
  });

  static Future<Map<String, dynamic>?> runUrlImport(
    MutationTarget ref,
    String url,
  ) => mutation.run(ref, (tsx) async {
    final model = await RecipePromptBuilder.build(tsx);
    if (model == null) return null;

    final String recipeContent;
    try {
      recipeContent = await RecipeContentExtractor.extract(url);
    } catch (e) {
      throw AiImportException.classifyUrlError(e);
    }

    final ChatResult result;
    try {
      result = await model.invoke({
        'input': [
          ChatMessageContent.text(
            "Extract the recipe from the following content:\n\n$recipeContent",
          ),
        ],
      });
    } catch (e) {
      throw AiImportException.classify(e);
    }

    try {
      return _parseResult(result);
    } catch (e) {
      throw AiImportException(AiImportErrorType.parseError, e);
    }
  });

  static Map<String, dynamic> _parseResult(ChatResult result) {
    final toolCalls = result.output.toolCalls;
    if (toolCalls.isEmpty) return {};

    final args = toolCalls.first.arguments;
    final recipes = (args['recipes'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final groceries = (args['groceries'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final recipeTags = (args['recipeTags'] as List? ?? [])
        .cast<Map<String, dynamic>>();

    final recipeData = <String, dynamic>{};
    for (final recipe in recipes) {
      final id = recipe['id'] as String?;
      if (id != null) recipeData[id] = recipe;
    }

    final groceryData = <String, dynamic>{};
    for (final grocery in groceries) {
      final id = grocery['id'] as String?;
      if (id == null) continue;
      grocery['normalAmount'] = 1;
      groceryData[id] = grocery;
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
