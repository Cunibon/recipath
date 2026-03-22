import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:recipath/gen/assets.gen.dart';
import 'package:recipath/widgets/providers/ai/ai_model_notifier.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

abstract class AiImportMutation {
  static final mutation = Mutation<ChatResult?>();

  static Future<ChatResult?> runImageImport(
    MutationTarget ref,
    Uint8List image,
  ) => mutation.run(ref, (tsx) async {
    final model = await _prepareModel(tsx);

    return model?.invoke({
      'input': [
        ChatMessageContent.text("Analyze this recipe image."),
        ChatMessageContent.image(
          data: base64Encode(image),
          mimeType: 'image/jpeg',
        ),
      ],
    });
  });

  static Future<ChatResult?> runUrlImport(
    MutationTarget ref,
    String url,
  ) => mutation.run(ref, (tsx) async {
    final model = await _prepareModel(tsx);

    final loader = WebBaseLoader([url]);
    final documents = await loader.load();

    final webpageText = documents.first.pageContent;

    return await model?.invoke({
      'input': [
        ChatMessageContent.text(
          "Analyze the following webpage content and extract the recipe: \n\n $webpageText",
        ),
      ],
    });
  });

  static Future<RunnableSequence<Map<String, dynamic>, ChatResult>?>
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

    final buffer = StringBuffer();

    for (final grocery in groceries.values) {
      buffer.write("${grocery.name}, ");
    }

    final groceryList = buffer.toString();
    final systemPrompt =
        '''
You are a professional Recipe Digitization Assistant and kitchen assistant.

Your goal is to extract structured recipe data from the provided image or URL into a strict JSON format matching the provided schema.

The user has the following groceries available: $groceryList.
When extracting recipes, prioritize using groceries the user already has; only create new groceries if necessary.
You must respond with valid JSON matching the provided schema.

CRITICAL RULES:

JSON ONLY:
- Output MUST be valid JSON.
- Do NOT include markdown, comments, or any extra text.

SCHEMA CONSISTENCY:
- Every "groceryId" used in "recipeData" MUST match a key in "groceryData".
- Every "id" field MUST match its parent map key.
- "tagData" keys MUST match recipe IDs from "recipeData".

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
  - "recipeData"
  - "groceryData"
  - "tagData"
  ''';

    final tool = ToolSpec(
      name: 'recipe_schema',
      description: 'Structured data for the import of recipes',
      inputJsonSchema: jsonSchema,
      strict: true,
    );

    final promptTemplate = ChatPromptTemplate.fromTemplates([
      (ChatMessageType.system, systemPrompt),
      (ChatMessageType.human, '{input}'),
    ]);

    return promptTemplate.pipe(
      mainModel.bind(
        mainModel.defaultOptions.copyWith(
          tools: [tool],
          toolChoice: ChatToolChoice.forced(name: 'recipe_schema'),
        ),
      ),
    );
  }
}
