import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier_notifier.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/nutriments_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/providers/recipe_overview_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/track_recipe_button.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_step.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/share_recipe_button.dart';
import 'package:recipath/widgets/tag/tag_list.dart';

class RecipeOverviewScreen extends ConsumerWidget {
  const RecipeOverviewScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final state = ref.watch(recipeOverviewScreenProvider(recipeId));
    final groceries = ref.watch(groceryProvider).value!;

    return CachedAsyncValueWrapper(
      asyncState: state,
      builder: (data) {
        final ingredients = data.recipeData.getIngredients(groceries);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              data.recipeData.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              ShareRecipeButton(recipes: [data.recipeData]),
              IconButton(
                onPressed: () => context.goRelative(
                  './${RecipeRoutes.recipeHistory.path}',
                  queryParameters: {idParameter: data.originalData.id},
                ),
                icon: Icon(Icons.cookie),
              ),
              IconButton(
                onPressed: () => context.goRelative(
                  './${RecipeRoutes.createRecipe.path}',
                  queryParameters: {idParameter: data.originalData.id},
                ),
                icon: Icon(Icons.edit),
              ),
            ],
          ),
          floatingActionButton: TrackRecipeButton(recipeData: data.recipeData),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.recipeData.imageName != null) ...[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: LocalImage(fileName: data.recipeData.imageName!),
                      ),
                    ),
                    Divider(),
                  ],
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 4,
                      bottom: 4,
                    ),
                    child: TagList(
                      selectedTags: data.tags,
                      onEdited: (newTags) async {
                        final added = newTags.difference(data.tags);
                        final removed = data.tags.difference(newTags);

                        final modifier = ref.read(recipeTagModifierProvider);
                        for (final addedTag in added) {
                          modifier.add(
                            RecipeTagData(
                              recipeId: recipeId,
                              tagId: addedTag.id,
                            ),
                          );
                        }
                        for (final removedTag in removed) {
                          modifier.delete(
                            RecipeTagData(
                              recipeId: recipeId,
                              tagId: removedTag.id,
                            ),
                          );
                        }
                      },
                    ),
                  ),
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
                                child: IngredientsList(
                                  ingredients: ingredients,
                                ),
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
                                  servings: data.recipeData.servings,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (data.recipeData.servings != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        key: Key(
                          "${data.originalData.servings} ${data.timer == null}",
                        ),
                        initialValue: data.recipeData.servings!.toString(),
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:
                              "${localization.servings} (${localization.baseValue}: ${data.originalData.servings})",
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
                                  recipeOverviewScreenProvider(
                                    recipeId,
                                  ).notifier,
                                )
                                .adjustServings(newServings);
                          }
                        },
                      ),
                    ),
                  for (int i = 0; i < data.recipeData.steps.length; i++)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RecipeStep(
                          index: i,
                          recipeData: data.recipeData,
                        ),
                      ),
                    ),
                  SizedBox(height: 78),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
