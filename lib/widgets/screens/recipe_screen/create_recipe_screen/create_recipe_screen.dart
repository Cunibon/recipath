import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/add_image_widget.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/recipe_step_view.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/timer_notifier.dart';

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
        ref.read(recipeNotifierProvider).value![widget.recipeId] ??
        RecipeData(
          id: randomAlphaNumeric(16),
          title: "",
          imageName: null,
          steps: [],
          uploaded: false,
        );

    data = initalData;
  }

  @override
  Widget build(BuildContext context) {
    return UnsavedChangesScope(
      canPop: data == initalData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create recipe",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  final goRouter = GoRouter.of(context);
                  if (widget.recipeId == null) {
                    await ref.read(recipeModifierNotifierProvider).add(data);
                    goRouter.pop();
                  } else if (data != initalData) {
                    final newData = data.copyWithNewId();

                    await ref
                        .read(recipeModifierNotifierProvider)
                        .replace(newData: newData, oldData: initalData);

                    ref
                        .read(timerNotifierProvider.notifier)
                        .moveTimer(newData: newData, oldData: initalData);

                    goRouter.go(
                      '${RootRoutes.recipeRoute.path}/recipeOverview/${newData.id}',
                    );
                  }
                  goRouter.pop();
                }
              },
              icon: Icon(Icons.save),
              label: Text("Save"),
            ),
            if (widget.recipeId != null)
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => DeleteConfirmationDialog(),
                  );

                  if (context.mounted && result == true) {
                    ref.read(recipeModifierNotifierProvider).archive(data);
                    context.go(RootRoutes.recipeRoute.path);
                  }
                },
                icon: Icon(Icons.delete),
                label: Text("Delete"),
              ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
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
                          decoration: InputDecoration(labelText: "Title"),
                          initialValue: data.title,
                          validator: (value) => value == null || value.isEmpty
                              ? "Add title"
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
                          decoration: InputDecoration(labelText: "Servings"),
                          keyboardType: TextInputType.number,
                          validator: (value) => value?.isEmpty == false
                              ? int.tryParse(value!) == null
                                    ? "Add valid servings"
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
                  RecipeStepView(
                    controller: controller,
                    steps: data.steps,
                    onChanged: (newSteps) =>
                        setState(() => data = data.copyWith(steps: newSteps)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
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
                      label: Text("Add step"),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
