import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/generic/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/add_image_widget.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/recipe_step_view.dart';
import 'package:recipe_list/widgets/main_screen/providers/recipe_notifier.dart';

class CreateRecipeScreen extends ConsumerStatefulWidget {
  const CreateRecipeScreen({this.recipeId, super.key});
  final String? recipeId;

  @override
  ConsumerState<CreateRecipeScreen> createState() => CreateRecipeScreenState();
}

class CreateRecipeScreenState extends ConsumerState<CreateRecipeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late RecipeData data;

  @override
  void initState() {
    super.initState();
    data =
        ref.read(recipeNotifierProvider)[widget.recipeId] ??
        RecipeData(
          id: randomAlphaNumeric(16),
          title: "",
          imageName: null,
          steps: [],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                ref.read(recipeNotifierProvider.notifier).addRecipe(data);
                context.pop();
              }
            },
            icon: Icon(Icons.save),
            label: Text("Save"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) => DeleteConfirmationDialog(),
              );

              if (result) {
                ref.read(recipeNotifierProvider.notifier).deleteRecipe(data);
              }
            },
            icon: Icon(Icons.delete),
            label: Text("Delete"),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddImageWidget(
                fileName: data.imageName,
                onChange: (newFileName) => setState(
                  () => data = data.copyWith(imageName: newFileName),
                ),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(labelText: "Title"),
                initialValue: data.title,
                validator: (value) =>
                    value == null || value.isEmpty ? "Add title" : null,
                onChanged: (value) =>
                    setState(() => data = data.copyWith(title: value)),
              ),
              RecipeStepView(
                steps: data.steps,
                onChanged: (newSteps) =>
                    setState(() => data = data.copyWith(steps: newSteps)),
              ),
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
                label: Text("Add step"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
