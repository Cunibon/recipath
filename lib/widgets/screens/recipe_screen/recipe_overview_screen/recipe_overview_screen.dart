import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/nutriments_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/providers/recipe_overview_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/track_recipe_button.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_step.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';

class RecipeOverviewScreen extends ConsumerWidget {
  const RecipeOverviewScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final state = ref.watch(recipeOverviewScreenProvider(recipeId));

    final groceries = ref.watch(groceryProvider).value!;
    final ingredients = state.recipeData.getIngredients(groceries);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          state.recipeData.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(
              Uri(
                path:
                    '${RootRoutes.recipeRoute.path}/recipeOverview/${state.originalData.id}/${RecipeRoutes.createRecipe.path}',
                queryParameters: {idParameter: state.originalData.id},
              ).toString(),
            ),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButton: TrackRecipeButton(recipeData: state.recipeData),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.recipeData.imageName != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: LocalImage(fileName: state.recipeData.imageName!),
                ),
                Divider(),
              ],
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: double.infinity,
                            child: IngredientsList(ingredients: ingredients),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: double.infinity,
                            child: NutrimentsList(
                              ingredients: ingredients,
                              servings: state.recipeData.servings,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.recipeData.servings != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    key: Key(
                      "${state.originalData.servings} ${state.timer == null}",
                    ),
                    initialValue: state.recipeData.servings!.toString(),
                    autovalidateMode: AutovalidateMode.always,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText:
                          "${localization.servings} (${localization.baseValue}: ${state.originalData.servings})",
                    ),
                    validator: (value) {
                      final newServings = int.tryParse(value!);
                      return newServings != null &&
                              !newServings.isNegative &&
                              newServings != 0
                          ? null
                          : localization.addRealNumber;
                    },
                    onChanged: (value) {
                      final newServings = int.tryParse(value);
                      if (newServings != null &&
                          !newServings.isNegative &&
                          newServings != 0) {
                        ref
                            .read(
                              recipeOverviewScreenProvider(recipeId).notifier,
                            )
                            .adjustServings(newServings);
                      }
                    },
                  ),
                ),
              for (int i = 0; i < state.recipeData.steps.length; i++)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RecipeStep(
                      index: i,
                      step: state.recipeData.steps[i],
                    ),
                  ),
                ),
              SizedBox(height: 78),
            ],
          ),
        ),
      ),
    );
  }
}
