import 'package:flutter_test/flutter_test.dart';
import 'package:recipath/data/ai/recipe_import_mapper.dart';

void main() {
  Map<String, dynamic> ingredient(String groceryId) => {
    'id': 'i-$groceryId',
    'amount': 1,
    'groceryId': groceryId,
    'unit': 'g',
  };

  Map<String, dynamic> output({
    List<Map<String, dynamic>> groceries = const [],
    List<Map<String, dynamic>> ingredients = const [],
    List<Map<String, dynamic>> recipeTags = const [],
  }) => {
    'recipes': [
      {
        'id': 'r1',
        'title': 'Stir-Fry',
        'steps': [
          {'id': 's1', 'description': 'Cook', 'ingredients': ingredients},
        ],
      },
    ],
    'groceries': groceries,
    'recipeTags': recipeTags,
  };

  List<dynamic> mappedIngredients(Map<String, dynamic> mapped) =>
      mapped['recipeData']['r1']['steps'][0]['ingredients'] as List;

  test('keys recipes and groceries by id and stamps normalAmount', () {
    final mapped = RecipeImportMapper.map(
      output(
        groceries: [
          {'id': 'g1', 'name': 'Butter'},
          {'name': 'No id'},
        ],
      ),
    );

    expect(mapped['recipeData'], contains('r1'));
    expect(mapped['groceryData'], hasLength(1));
    expect(mapped['groceryData']['g1']['normalAmount'], 1);
  });

  test('resolves a groceryId given as a unique grocery name', () {
    final mapped = RecipeImportMapper.map(
      output(
        groceries: [
          {'id': 'g1', 'name': 'Butter'},
        ],
        ingredients: [ingredient(' butter ')],
      ),
    );

    expect(mappedIngredients(mapped).single['groceryId'], 'g1');
  });

  test('leaves an ambiguous grocery name unresolved', () {
    final mapped = RecipeImportMapper.map(
      output(
        groceries: [
          {'id': 'g1', 'name': 'Butter'},
          {'id': 'g2', 'name': 'butter'},
        ],
        ingredients: [ingredient('Butter')],
      ),
    );

    expect(mappedIngredients(mapped).single['groceryId'], 'Butter');
  });

  test('marks recipe tags with the Recipe tag type', () {
    final mapped = RecipeImportMapper.map(
      output(
        recipeTags: [
          {
            'recipeId': 'r1',
            'tags': [
              {'id': 't1', 'name': 'Asian'},
            ],
          },
        ],
      ),
    );

    expect(mapped['tagData']['r1'].single['tagType'], 'Recipe');
  });

  test('tolerates missing top-level lists', () {
    expect(RecipeImportMapper.map({}), {
      'recipeData': {},
      'groceryData': {},
      'tagData': {},
    });
  });
}
