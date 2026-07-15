import 'dart:convert';
import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/gorcery_tag_modifier/grocery_tag_modifier_notifier.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application/recipe_statistics_modifier/recipe_statistics_modifier_notifier.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier_notifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/application/tag_modifier/tag_modifier_notifier.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';

const groceryTagDataKey = 'groceryTagData';
const _fixturePath = 'test/screenshots/fixtures/example.recipath';

typedef SeededData = ({
  IMap<String, GroceryData> groceries,
  List<RecipeData> recipes,
});

typedef _Fixture = ({
  Map<String, GroceryData> groceries,
  List<RecipeData> recipes,
  Map<String, List<TagData>> tagsPerRecipe,
  Map<String, List<TagData>> tagsPerGrocery,
});

Future<SeededData> seedFixtureData(
  ProviderContainer container, {
  required bool fullyStocked,
}) async {
  final fixture = _parseFixture();

  final groceryModifier = container.read(groceryModifierProvider);
  for (final grocery in fixture.groceries.values) {
    await groceryModifier.add(grocery);
  }

  final recipeModifier = container.read(recipeModifierProvider);
  for (final recipe in fixture.recipes) {
    await recipeModifier.add(recipe);
  }

  await _insertTags(container, fixture);

  final groceries = fixture.groceries.lock;
  await _seedStorage(container, groceries, fullyStocked: fullyStocked);
  await _seedShoppingList(container, fixture.recipes, groceries);
  await _seedStatistics(container, fixture.recipes);

  return (groceries: groceries, recipes: fixture.recipes);
}

_Fixture _parseFixture() {
  final raw =
      jsonDecode(File(_fixturePath).readAsStringSync()) as Map<String, dynamic>;

  final groceries = <String, GroceryData>{};
  for (final json in (raw[groceryDataKey] as Map).values) {
    final grocery = GroceryData.fromJson((json as Map).cast<String, Object?>());
    groceries[grocery.id] = grocery;
  }

  final recipes = [
    for (final json in (raw[recipeDataKey] as Map).values)
      RecipeData.fromJson((json as Map).cast<String, Object?>()),
  ];

  return (
    groceries: groceries,
    recipes: recipes,
    tagsPerRecipe: _parseTags(raw[tagDataKey] as Map),
    tagsPerGrocery: _parseTags((raw[groceryTagDataKey] ?? {}) as Map),
  );
}

Map<String, List<TagData>> _parseTags(Map source) => {
  for (final entry in source.entries)
    entry.key as String: [
      for (final json in entry.value as List)
        TagData.fromJson((json as Map).cast<String, Object?>()),
    ],
};

Future<void> _insertTags(ProviderContainer container, _Fixture fixture) async {
  final tagModifier = container.read(tagModifierProvider);
  final recipeTagModifier = container.read(recipeTagModifierProvider);
  final groceryTagModifier = container.read(groceryTagModifierProvider);
  final seenTags = <String>{};

  Future<void> addTagOnce(TagData tag) async {
    if (seenTags.add(tag.id)) {
      await tagModifier.add(tag);
    }
  }

  for (final entry in fixture.tagsPerRecipe.entries) {
    for (final tag in entry.value) {
      await addTagOnce(tag);
      await recipeTagModifier.add(
        RecipeTagData(recipeId: entry.key, tagId: tag.id),
      );
    }
  }

  for (final entry in fixture.tagsPerGrocery.entries) {
    for (final tag in entry.value) {
      await addTagOnce(tag);
      await groceryTagModifier.add(
        GroceryTagData(groceryId: entry.key, tagId: tag.id),
      );
    }
  }
}

Future<void> _seedStorage(
  ProviderContainer container,
  IMap<String, GroceryData> groceries, {
  required bool fullyStocked,
}) async {
  const fixedAmounts = <String, double>{
    'Bananas': 5,
    'Baking powder': 10,
    'Brown sugar': 377.5,
    'Ground beef': 500,
    'Honey': 232.98,
    'Sugar': 850,
    'Flour': 750,
    'Rice': 800,
    'Cottage cheese': 425,
  };
  final skip = fullyStocked
      ? const <String>{}
      : const <String>{'Chicken', 'Cottage cheese', 'Tomato passata'};

  final storageModifier = container.read(storageModifierProvider);
  const multipliers = [1.0, 0.5, 2.0];
  var index = 0;

  final sorted = groceries.values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));
  for (final grocery in sorted) {
    final name = grocery.name.trim();
    if (skip.contains(name)) continue;

    final amount =
        fixedAmounts[name] ??
        grocery.normalAmount * multipliers[index++ % multipliers.length];
    await storageModifier.addItem(
      IngredientData(
        id: randomAlphaNumeric(16),
        amount: amount,
        unit: grocery.unit,
        groceryId: grocery.id,
      ),
    );
  }
}

Future<void> _seedShoppingList(
  ProviderContainer container,
  List<RecipeData> recipes,
  IMap<String, GroceryData> groceries,
) async {
  final shoppingModifier = container.read(shoppingModifierProvider);
  final planned = recipes.where(
    (recipe) =>
        recipe.title.trim() == 'Chicken teriyaki' ||
        recipe.title.trim() == 'Bolognese',
  );

  final ingredients = [
    for (final recipe in planned) ...recipe.getIngredients(groceries),
  ];
  await shoppingModifier.addItems(ingredients, groceries);
}

Future<void> _seedStatistics(
  ProviderContainer container,
  List<RecipeData> recipes,
) async {
  final statisticsModifier = container.read(recipeStatisticsModifierProvider);
  final now = DateTime.now();

  const cookDurations = [29, 41, 35, 24];
  var slot = 0;

  Future<void> addEntry(RecipeData recipe, int daysAgo) async {
    final minutes = cookDurations[slot++ % cookDurations.length];
    final start = now.subtract(Duration(days: daysAgo, hours: 5));
    await statisticsModifier.add(
      RecipeStatisticData(
        id: randomAlphaNumeric(16),
        startDate: start,
        endDate: start.add(Duration(minutes: minutes)),
        recipeId: recipe.id,
        servings: recipe.servings,
      ),
    );
  }

  for (final (index, recipe) in recipes.indexed) {
    await addEntry(recipe, (index % 6) + 1);
  }
  await addEntry(recipes.last, 3);
}
