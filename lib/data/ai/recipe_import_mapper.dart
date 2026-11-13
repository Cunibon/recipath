abstract class RecipeImportMapper {
  static Map<String, dynamic> map(Map<String, dynamic> output) {
    final recipes = (output['recipes'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final groceries = (output['groceries'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final recipeTags = (output['recipeTags'] as List? ?? [])
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
