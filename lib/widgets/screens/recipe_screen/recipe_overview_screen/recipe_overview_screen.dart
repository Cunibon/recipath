import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/nutriments_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/track_recipe_button.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_step.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';

class RecipeOverviewScreen extends ConsumerWidget {
  const RecipeOverviewScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _RecipeOverviewScreen(
      originalData: ref.watch(
        recipeNotifierProvider.select((value) => value.value?[recipeId]),
      )!,
    );
  }
}

class _RecipeOverviewScreen extends ConsumerStatefulWidget {
  const _RecipeOverviewScreen({required this.originalData});

  final RecipeData originalData;

  @override
  ConsumerState<_RecipeOverviewScreen> createState() =>
      __RecipeOverviewScreenState();
}

class __RecipeOverviewScreenState extends ConsumerState<_RecipeOverviewScreen> {
  late RecipeData recipeData;

  @override
  void didUpdateWidget(covariant _RecipeOverviewScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.originalData != widget.originalData) {
      setState(() => setInitialData());
    }
  }

  @override
  void initState() {
    super.initState();
    setInitialData();
  }

  void setInitialData() {
    final timer = ref.read(timerNotifierProvider)[widget.originalData.id];
    recipeData = widget.originalData.adjustIngredientForPlannedServings(
      timer?.servings ?? widget.originalData.servings,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final groceries = ref.watch(groceryNotifierProvider).value!;
    final ingredients = recipeData.getIngredients(groceries);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeData.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(
              Uri(
                path:
                    '${RootRoutes.recipeRoute.path}/recipeOverview/${widget.originalData.id}/${RecipeRoutes.createRecipe.path}',
                queryParameters: {idParameter: widget.originalData.id},
              ).toString(),
            ),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButton: TrackRecipeButton(recipeData: recipeData),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipeData.imageName != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: LocalImage(fileName: recipeData.imageName!),
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
                              servings: recipeData.servings,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (recipeData.servings != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    initialValue: recipeData.servings!.toString(),
                    decoration: InputDecoration(
                      labelText:
                          "${localization.servings} (${localization.baseValue}: ${widget.originalData.servings})",
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final newServings = int.tryParse(value!);
                      return newServings == null ||
                              newServings.isNegative ||
                              newServings == 0
                          ? localization.addRealNumber
                          : null;
                    },
                    onChanged: (value) {
                      final newServings = int.tryParse(value);
                      if (newServings != null &&
                          !newServings.isNegative &&
                          newServings != 0) {
                        setState(() {
                          recipeData = widget.originalData
                              .adjustIngredientForPlannedServings(newServings);
                          ref
                              .read(timerNotifierProvider.notifier)
                              .adjustServings(recipeData.id, newServings);
                        });
                      }
                    },
                  ),
                ),
              for (int i = 0; i < recipeData.steps.length; i++)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RecipeStep(index: i, step: recipeData.steps[i]),
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
