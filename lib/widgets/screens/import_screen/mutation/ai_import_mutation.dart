import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:genkit/genkit.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/ai/ai_import_exception.dart';
import 'package:recipath/data/ai/recipe_import_mapper.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/providers/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_content_extractor.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/recipe_prompt_builder.dart';

abstract class AiImportMutation {
  static final mutation = Mutation();

  static void runImageImport(MutationTarget ref, Uint8List image) =>
      _runImport(ref, (tsx) => runImagePrompt(tsx, image));

  static void runUrlImport(MutationTarget ref, String url) =>
      _runImport(ref, (tsx) => runUrlPrompt(tsx, url));

  static void _runImport(
    MutationTarget ref,
    Future<Map<String, dynamic>?> Function(MutationTransaction tsx) prompt,
  ) => mutation.run(ref, (tsx) async {
    final result = await prompt(tsx);
    if (result != null) {
      await _import(tsx, result);
    }
  }).ignore();

  static Future<void> _import(
    MutationTransaction tsx,
    Map<String, dynamic> result,
  ) async {
    final directory = Directory(
      "${tsx.get(applicationPathProvider).path}/ai_import",
    );
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
    await directory.create(recursive: true);

    final file = File("${directory.path}/${randomAlphaNumeric(16)}");
    await file.writeAsString(jsonEncode(result));

    tsx
        .get(goRouterProvider)
        .go(
          "${RootRoutes.importRoute.path}/${ImportRoutes.recipeImport.path}",
          extra: file.path,
        );
  }

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
    final GenerateResult<Map<String, dynamic>> result;
    try {
      result = await prompt.backend.generate(
        systemPrompt: prompt.systemPrompt,
        userContent: userContent,
        outputSchema: prompt.outputSchema,
      );
    } catch (e) {
      throw AiImportException.classify(e);
    }

    final output = result.output;
    if (output == null) {
      throw AiImportException(
        AiImportErrorType.parseError,
        FormatException(
          'No structured output (finish reason: ${result.finishReason})',
        ),
      );
    }

    try {
      return RecipeImportMapper.map(output);
    } catch (e) {
      throw AiImportException(AiImportErrorType.parseError, e);
    }
  }
}
