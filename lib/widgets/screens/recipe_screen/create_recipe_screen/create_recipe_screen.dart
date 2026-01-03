import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier_notifier.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/add_image_widget.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/dialogs/make_copy_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/recipe_step_view.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';

class CreateRecipeScreen extends ConsumerStatefulWidget {
  const CreateRecipeScreen({this.recipeId, super.key});
  final String? recipeId;

  @override
  ConsumerState<CreateRecipeScreen> createState() => CreateRecipeScreenState();
}

class CreateRecipeScreenState extends ConsumerState<CreateRecipeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = ScrollController();
  late RecipeData initalData;
  late RecipeData data;

  @override
  void initState() {
    super.initState();
    initalData =
        ref.read(recipeProvider).value?[widget.recipeId] ??
        RecipeData(
          id: randomAlphaNumeric(16),
          title: "",
          imageName: null,
          steps: [],
        );

    data = initalData;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return UnsavedChangesScope(
      canPop: data == initalData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.createRecipe,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            if (widget.recipeId != null)
              IconButton(
                onPressed: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => DeleteConfirmationDialog(),
                  );

                  if (context.mounted && result == true) {
                    ref.read(recipeModifierProvider).archive(data);
                    context.go(RootRoutes.recipeRoute.path);
                  }
                },
                icon: Icon(Icons.delete),
              ),
          ],
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  final goRouter = GoRouter.of(context);

                  if (widget.recipeId == null ||
                      initalData.steps.length == data.steps.length &&
                          initalData.diffIngredients(data).isEmpty) {
                    await ref.read(recipeModifierProvider).add(data);
                    goRouter.pop();
                  } else if (data != initalData) {
                    final newData = data.copyWithNewId();
                    final tags = ref.read(
                      tagsPerRecipeProvider.select(
                        (data) => data.value?[initalData.id] ?? {},
                      ),
                    );

                    await ref
                        .read(recipeModifierProvider)
                        .replace(newData: newData, oldData: initalData);

                    ref
                        .read(timerProvider.notifier)
                        .moveTimer(newData: newData, oldData: initalData);

                    for (final tag in tags) {
                      await ref
                          .read(recipeTagModifierProvider)
                          .add(
                            RecipeTagData(recipeId: newData.id, tagId: tag.id),
                          );
                    }

                    goRouter.go(
                      '${RootRoutes.recipeRoute.path}/recipeOverview/${newData.id}',
                    );
                  } else {
                    goRouter.pop();
                  }
                }
              },
              icon: Icon(Icons.save),
              label: Text(localization.save),
            ),
            if (widget.recipeId != null)
              ElevatedButton.icon(
                onPressed: () async {
                  if (formKey.currentState?.validate() == true) {
                    final goRouter = GoRouter.of(context);

                    final result = await showDialog<bool>(
                      context: context,
                      builder: (context) => MakeCopyDialog(),
                    );

                    if (result == true) {
                      final newData = data.copyWithNewId().copyWith(
                        title: "${data.title} (${localization.copy})",
                      );
                      final tags = ref.read(
                        tagsPerRecipeProvider.select(
                          (data) => data.value?[initalData.id] ?? {},
                        ),
                      );
                      await ref.read(recipeModifierProvider).add(newData);

                      for (final tag in tags) {
                        await ref
                            .read(recipeTagModifierProvider)
                            .add(
                              RecipeTagData(
                                recipeId: newData.id,
                                tagId: tag.id,
                              ),
                            );
                      }

                      goRouter.go(
                        '${RootRoutes.recipeRoute.path}/recipeOverview/${newData.id}',
                      );
                    }
                  }
                },
                icon: Icon(Icons.copy),
                label: Text(localization.saveCopy),
              ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RecipeStepView(
              header: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: AddImageWidget(
                      fileName: data.imageName,
                      onChanged: (newFileName) => setState(
                        () => data = data.copyWith(imageName: newFileName),
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: localization.title,
                          ),
                          initialValue: data.title,
                          validator: (value) => value == null || value.isEmpty
                              ? localization.addTitle
                              : null,
                          onChanged: (value) => setState(
                            () => data = data.copyWith(title: value),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          initialValue: data.servings?.toString() ?? "",
                          decoration: InputDecoration(
                            labelText: localization.servings,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) => value?.isEmpty == false
                              ? int.tryParse(value!) == null
                                    ? localization.addRealNumber
                                    : null
                              : null,
                          onChanged: (value) {
                            final parsed = int.tryParse(value);
                            setState(
                              () => data = data.copyWith(servings: parsed),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => setState(
                      () => data = data.copyWith(
                        steps: List.from(data.steps)
                          ..add(
                            RecipeStepData(
                              id: randomAlphaNumeric(16),
                              description: "",
                              ingredients: [],
                            ),
                          ),
                      ),
                    ),
                    icon: Icon(Icons.add),
                    label: Text(localization.addStep),
                  ),
                  SizedBox(height: 64),
                ],
              ),
              controller: controller,
              steps: data.steps,
              onChanged: (newSteps) =>
                  setState(() => data = data.copyWith(steps: newSteps)),
            ),
          ),
        ),
      ),
    );
  }
}
