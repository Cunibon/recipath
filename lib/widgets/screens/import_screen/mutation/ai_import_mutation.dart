import 'dart:convert';

import 'package:bound_mutation/bound_mutation.dart';
import 'package:flutter/services.dart';
import 'package:langchain/langchain.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_exception.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_content_extractor.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_prompt_builder.dart';

final aiImageImportMutation = BoundMutation<Map<String, dynamic>?, Uint8List>((
  transaction,
  input,
) async {
  final model = await RecipePromptBuilder.build(transaction);
  if (model == null) return null;

  final ChatResult result;
  try {
    result = await model.invoke([
      ChatMessageContent.text(
        "Extract the recipe from this image, including all ingredients and steps.",
      ),
      ChatMessageContent.image(
        data: base64Encode(input),
        mimeType: 'image/jpeg',
      ),
    ]);
  } catch (e) {
    throw AiImportException.classify(e);
  }

  try {
    return _parseResult(result);
  } catch (e) {
    throw AiImportException(AiImportErrorType.parseError, e);
  }
});

final aiUrlImportMutation = BoundMutation<Map<String, dynamic>?, String>((
  transaction,
  input,
) async {
  final model = await RecipePromptBuilder.build(transaction);
  if (model == null) return null;

  final String recipeContent;
  try {
    recipeContent = await RecipeContentExtractor.extract(input);
  } catch (e) {
    throw AiImportException.classifyUrlError(e);
  }

  final ChatResult result;
  try {
    result = await model.invoke([
      ChatMessageContent.text(
        "Extract the recipe from the following content:\n\n$recipeContent",
      ),
    ]);
  } catch (e) {
    throw AiImportException.classify(e);
  }

  try {
    return _parseResult(result);
  } catch (e) {
    throw AiImportException(AiImportErrorType.parseError, e);
  }
});

Map<String, dynamic> _parseResult(ChatResult result) {
  final toolCalls = result.output.toolCalls;
  if (toolCalls.isEmpty) return {};

  final args = toolCalls.first.arguments;
  final recipes = (args['recipes'] as List? ?? []).cast<Map<String, dynamic>>();
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
