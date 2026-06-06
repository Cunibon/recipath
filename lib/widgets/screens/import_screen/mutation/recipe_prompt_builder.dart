import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:langchain/langchain.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/gen/assets.gen.dart';
import 'package:recipath/widgets/providers/ai/ai_model_notifier.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/typed_tag_notifier.dart';

abstract class RecipePromptBuilder {
  static Future<
    Runnable<List<ChatMessageContent>, RunnableOptions, ChatResult>?
  >
  build(MutationTransaction tsx) async {
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
      groceryBuffer.write("${grocery.name} ${grocery.unit.name}, ");
    }
    final groceryList = groceryBuffer.toString();

    final typedTags = await tsx.get(typedTagProvider.future);
    final recipeTags = typedTags[TagTypeEnum.recipe]!;
    final tagBuffer = StringBuffer();

    for (final tag in recipeTags.values) {
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
If an existing tag related to AI exists (e.g., "AI", "AI-generated", "AI-created"), apply it to this recipe.
New tags should have a unique color.

CRITICAL RULES:

SCHEMA CONSISTENCY:
- Every "groceryId" used in recipe ingredients MUST match an "id" in the "groceries" array.
- Every "recipeId" in "recipeTags" MUST match an "id" in the "recipes" array.

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

INGREDIENT DEDUPLICATION (critical):
- Each ingredient should appear in ONLY ONE step's ingredients array — the step where it is first added or prepared.
- NEVER list the same ingredient with its full amount in multiple steps. This causes incorrect totals (e.g. 800g chicken in two steps = 160g total, which is wrong).
- If an ingredient is mentioned in a later step but was already added earlier, do NOT include it again. The step description can still refer to it by name, but it must not appear in that step's ingredients array.
- Example: If a recipe uses 800g chicken breast — Step 1 "Cut the chicken breast into pieces" includes 800g chicken in its ingredients. Step 2 "Marinate the chicken with garlic, ginger, and yogurt" does NOT include chicken in its ingredients (it was already added in Step 1). Only new ingredients like garlic, ginger, and yogurt belong to Step 2.
- Exception: If a recipe genuinely uses separate portions of the same ingredient at different stages (e.g. 200g flour for batter + 50g flour for dusting), list each portion in its respective step. The amounts across all steps must sum to the correct total for that ingredient.

STEP SPLITTING:
- Each step should focus on a single coherent task — do not chain unrelated actions together.
- BAD: "Cut the onions and garlic, heat butter in a pan and saute them for 3 minutes, then add the bacon."
- GOOD: Step 1: "Cut the onions and garlic." → Step 2: "Heat butter in a pan and saute the onions and garlic for 3 minutes." → Step 3: "Add the bacon and cook until golden brown."
- When splitting, repeat ingredient context so each step makes sense on its own.

STEP DESCRIPTIONS:
- Do NOT include units or amounts in the step description text. Each step already has its ingredients linked with their amounts, so repeating them is redundant and breaks when servings are adjusted.
- BAD: "Add 200g of flour and 100ml of milk to the bowl."
- GOOD: "Add the flour and milk to the bowl."
- Refer to ingredients by name only, without quantities or units.

TIMERS:
- Convert all durations to minutes (e.g. 1.5 hours → 90).
- Only set "minutes" for longer passive/unattended steps where the cook might walk away and needs a reminder (e.g. simmering, baking, resting, marinating).
- Do NOT set "minutes" for short active tasks like "saute for 3 minutes" or "stir for 1 minute" — the cook is actively engaged and does not need a timer.
- If no timer is needed, set "minutes": null.
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

    return Runnable.fromFunction<List<ChatMessageContent>, ChatResult>(
      invoke: (input, options) async {
        final messages = [
          SystemChatMessage(content: systemPrompt),
          HumanChatMessage(content: ChatMessageContent.multiModal(input)),
        ];
        return await toolModel.invoke(PromptValue.chat(messages));
      },
    );
  }
}
