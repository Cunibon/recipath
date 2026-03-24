import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:recipath/gen/assets.gen.dart';
import 'package:recipath/widgets/providers/ai/ai_model_notifier.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';

abstract class AiImportMutation {
  static final mutation = Mutation<Map<String, dynamic>?>();

  static Future<Map<String, dynamic>?> runImageImport(
    MutationTarget ref,
    Uint8List image,
  ) => mutation.run(ref, (tsx) async {
    final model = await _prepareModel(tsx);
    if (model == null) return null;

    final result = await model.invoke({
      'input': [
        ChatMessageContent.text("Analyze this recipe image."),
        ChatMessageContent.image(
          data: base64Encode(image),
          mimeType: 'image/jpeg',
        ),
      ],
    });

    return _parseResult(result);
  });

  static Future<Map<String, dynamic>?> runUrlImport(
    MutationTarget ref,
    String url,
  ) => mutation.run(ref, (tsx) async {
    final model = await _prepareModel(tsx);
    if (model == null) return null;

    final loader = WebBaseLoader([url]);
    final documents = await loader.load();
    final webpageText = documents.first.pageContent;

    final result = await model.invoke({
      'input': [
        ChatMessageContent.text(
          "Analyze the following webpage content and extract the recipe: \n\n $webpageText",
        ),
      ],
    });

    return _parseResult(result);
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
      if (id != null) groceryData[id] = grocery;
    }

    final tagData = <String, dynamic>{};
    for (final rt in recipeTags) {
      final recipeId = rt['recipeId'] as String?;
      final tags = rt['tags'] as List?;
      if (recipeId != null && tags != null) {
        tagData[recipeId] = tags;
      }
    }

    return {
      'recipeData': recipeData,
      'groceryData': groceryData,
      'tagData': tagData,
    };
  }

  static Future<Runnable<Map<String, dynamic>, RunnableOptions, ChatResult>?>
  _prepareModel(MutationTransaction tsx) async {
    final aiProvider = await tsx.get(aiProviderProvider.future);
    if (aiProvider == null) return null;

    final mainModel = tsx.get(aiModelProvider(aiProvider));
    if (mainModel == null) return null;

    final jsonSchemaString = await rootBundle.loadString(
      Assets.structuredOutput.recipeSchema,
    );
    final jsonSchema = jsonDecode(jsonSchemaString);

    final groceries = await tsx.get(groceryProvider.future);
    final groceryBuffer = StringBuffer();

    for (final grocery in groceries.values) {
      groceryBuffer.write("${grocery.name}, ");
    }
    final groceryList = groceryBuffer.toString();

    final tags = await tsx.get(tagProvider.future);
    final tagBuffer = StringBuffer();

    for (final tag in tags.values) {
      tagBuffer.write("${tag.name}, ");
    }
    final tagList = tagBuffer.toString();

    final locale = tsx.get(localeProvider);
    final userLanguage = locale.languageCode;

    final systemPrompt =
        '''
You are a professional Recipe Digitization Assistant and kitchen assistant.

Your goal is to extract structured recipe data from the provided image or URL into a strict JSON format matching the provided schema.

The user's preferred language is: $userLanguage. Translate recipe titles, steps, and descriptions into $userLanguage.
The source may be in any language, but your output MUST be in $userLanguage.

GROCERY MATCHING (highest priority):
The user has the following groceries available: $groceryList.
When a recipe ingredient matches an existing grocery, you MUST reuse it with its EXACT original name — do NOT translate or rename it.
Only create a new grocery if no existing one matches. New grocery names should be in $userLanguage.

TAG MATCHING:
The user has the following tags available: $tagList.
When a tag matches an existing one, reuse it with its EXACT original name — do NOT translate or rename it.
Only create new tags if no existing one matches. New tag names should be in $userLanguage.
New tags should have a unique color.

You must respond with valid JSON matching the provided schema.

CRITICAL RULES:

JSON ONLY:
- Output MUST be valid JSON.
- Do NOT include markdown, comments, or any extra text.

SCHEMA CONSISTENCY:
- Every "groceryId" used in recipe ingredients MUST match an "id" in the "groceries" array.
- Every "recipeId" in "recipeTags" MUST match an "id" in the "recipes" array.

STRING SAFETY:
- NEVER use unescaped double quotes inside string values.
- Replace inch symbols with the word "inch".

TAGGING LOGIC:
- Assign an appropriate meal type (e.g. Main Course, Side Dish, Dessert, Drink).
- NEVER classify drinks as Main Course.
- Only add tags like Vegetarian, Vegan, Gluten-Free if strictly correct.

NUTRITION DATA:
- For each grocery, estimate kcal, fat, carbs, protein, and fiber per 100g using standard values.
- Use null only if estimation is not possible.

UNIT CONVERSIONS:
- Provide realistic conversionAmount and conversionUnit.
- Use these approximations when applicable:
  - 1 Cup Flour ≈ 120g
  - 1 Cup Sugar ≈ 200g
  - 1 Cup Water/Milk ≈ 240g

TIMERS:
- Convert all durations to minutes (e.g. 1.5 hours → 90).
- If no time is implied, set "minutes": null.

OUTPUT:
- Return a single JSON object with:
  - "recipes": array of recipe objects
  - "groceries": array of grocery objects
  - "recipeTags": array of {recipeId, tags} objects
  ''';

    final tool = ToolSpec(
      name: 'recipe_schema',
      description: 'Structured data for the import of recipes',
      inputJsonSchema: jsonSchema,
      strict: true,
    );

    final toolModel = mainModel.bind(
      mainModel.defaultOptions.copyWith(
        tools: [tool],
        toolChoice: ChatToolChoice.forced(name: 'recipe_schema'),
      ),
    );

    return Runnable.fromFunction<Map<String, dynamic>, ChatResult>(
      invoke: (input, options) async {
        final inputContent = input['input'] as List<ChatMessageContent>;
        final messages = [
          SystemChatMessage(content: systemPrompt),
          HumanChatMessage(
            content: ChatMessageContent.multiModal(inputContent),
          ),
        ];
        return await toolModel.invoke(PromptValue.chat(messages));
      },
    );
  }
}
