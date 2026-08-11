import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

final _unitInName = RegExp(
  r'(\(|\[|,\s*)\s*(g|kg|ml|l|oz|lb|tsp|tbsp|cup|cups|gram|grams|milliliter|liter|ounce|pound)\s*(\)|\]|$)',
  caseSensitive: false,
);

void assertRecipeImportInvariants(
  Map<String, dynamic> result, {
  required Set<String> allowedUnits,
}) {
  final recipeData = result['recipeData'] as Map<String, dynamic>;
  final groceryData = result['groceryData'] as Map<String, dynamic>;
  final tagData = result['tagData'] as Map<String, dynamic>;

  expect(recipeData, isNotEmpty, reason: 'no recipes returned');
  expect(groceryData, isNotEmpty, reason: 'no groceries returned');

  for (final entry in groceryData.entries) {
    final grocery = entry.value as Map<String, dynamic>;
    final name = grocery['name'] as String? ?? '';

    expect(
      grocery['unit'],
      isIn(allowedUnits),
      reason: 'grocery "$name" has out-of-enum unit ${grocery['unit']}',
    );
    expect(
      grocery['conversionUnit'],
      isIn(allowedUnits),
      reason: 'grocery "$name" has out-of-enum conversionUnit',
    );
    expect(
      _unitInName.hasMatch(name),
      isFalse,
      reason: 'unit text embedded in grocery name "$name"',
    );
    expect(grocery['normalAmount'], 1, reason: 'normalAmount not stamped');
  }

  for (final entry in recipeData.entries) {
    final recipe = entry.value as Map<String, dynamic>;
    expect(
      recipe['title'],
      isA<String>().having((t) => t.isNotEmpty, 'non-empty', isTrue),
      reason: 'recipe ${entry.key} has no title',
    );

    final steps = recipe['steps'] as List? ?? const [];
    expect(steps, isNotEmpty, reason: 'recipe ${entry.key} has no steps');

    for (final step in steps.cast<Map<String, dynamic>>()) {
      final ingredients = step['ingredients'] as List? ?? const [];
      for (final ingredient in ingredients.cast<Map<String, dynamic>>()) {
        expect(
          groceryData.containsKey(ingredient['groceryId']),
          isTrue,
          reason: 'dangling groceryId ${ingredient['groceryId']}',
        );
        expect(
          ingredient['unit'],
          isIn(allowedUnits),
          reason: 'ingredient has out-of-enum unit ${ingredient['unit']}',
        );
      }
    }
  }

  for (final recipeId in tagData.keys) {
    expect(
      recipeData.containsKey(recipeId),
      isTrue,
      reason: 'recipeTags references unknown recipeId $recipeId',
    );
  }
}

Set<String> allowedUnitsFromAsset() {
  final schema =
      jsonDecode(
            File('assets/structured_output/recipe_schema.json').readAsStringSync(),
          )
          as Map<String, dynamic>;
  final groceries = schema['properties']['groceries'] as Map<String, dynamic>;
  final items = groceries['items'] as Map<String, dynamic>;
  final unit = (items['properties'] as Map)['unit'] as Map<String, dynamic>;
  return (unit['enum'] as List).cast<String>().toSet();
}

String summarize(
  Map<String, dynamic> result, {
  required Set<String> existingGroceryNames,
  required Set<String> existingTagNames,
}) {
  final recipeData = result['recipeData'] as Map<String, dynamic>;
  final groceryData = result['groceryData'] as Map<String, dynamic>;

  final groceryNames = _groceryNames(result).toList();
  final tagNames = _tagNames(result).toList();

  final reusedGroceries = groceryNames
      .where(existingGroceryNames.contains)
      .length;
  final reusedTags = tagNames.where(existingTagNames.contains).length;

  final steps = recipeData.values.fold<int>(
    0,
    (total, recipe) =>
        total + ((recipe as Map<String, dynamic>)['steps'] as List? ?? []).length,
  );

  return '${recipeData.length} recipe(s), $steps steps, '
      '${groceryData.length} groceries ($reusedGroceries reused), '
      '${tagNames.length} tags ($reusedTags reused)';
}

void assertExistingGroceriesReused(
  Map<String, dynamic> result,
  Set<String> existingNames, {
  bool requireAtLeastOne = true,
}) => _assertNamesReusedExactly(
  _groceryNames(result),
  existingNames,
  'grocery',
  requireAtLeastOne: requireAtLeastOne,
);

void assertExistingTagsReused(
  Map<String, dynamic> result,
  Set<String> existingNames, {
  bool requireAtLeastOne = true,
}) => _assertNamesReusedExactly(
  _tagNames(result),
  existingNames,
  'tag',
  requireAtLeastOne: requireAtLeastOne,
);

void _assertNamesReusedExactly(
  Iterable<String> returnedNames,
  Set<String> existingNames,
  String label, {
  required bool requireAtLeastOne,
}) {
  final byLowercase = {
    for (final name in existingNames) name.toLowerCase(): name,
  };
  var reused = 0;

  for (final name in returnedNames) {
    final existing = byLowercase[name.trim().toLowerCase()];
    if (existing == null) continue;
    reused++;

    expect(
      name,
      existing,
      reason:
          '$label "$name" matches the user\'s existing "$existing" but was not '
          'copied character for character, so the import would create a duplicate',
    );
  }

  if (!requireAtLeastOne) return;

  expect(
    reused,
    greaterThan(0),
    reason:
        'the fixture recipe overlaps the seeded pantry, so at least one existing '
        '$label should have been reused. Zero reuse means the model ignored the '
        '$label list, or the list never reached it. Returned: '
        '${returnedNames.toList()}; available: ${existingNames.toList()}',
  );
}

Iterable<String> _groceryNames(Map<String, dynamic> result) =>
    (result['groceryData'] as Map<String, dynamic>).values.map(
      (grocery) => (grocery as Map<String, dynamic>)['name'] as String? ?? '',
    );

Iterable<String> _tagNames(Map<String, dynamic> result) =>
    (result['tagData'] as Map<String, dynamic>).values
        .expand((tags) => tags as List)
        .map((tag) => (tag as Map<String, dynamic>)['name'] as String? ?? '');
