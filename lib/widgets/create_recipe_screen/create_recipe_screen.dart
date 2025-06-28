import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/widgets/create_recipe_screen/add_image_widget.dart';

class CreateRecipeScreen extends ConsumerStatefulWidget {
  const CreateRecipeScreen({this.data, super.key});
  final RecipeData? data;

  @override
  ConsumerState<CreateRecipeScreen> createState() => CreateRecipeScreenState();
}

class CreateRecipeScreenState extends ConsumerState<CreateRecipeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController titleController;
  late RecipeData data;

  @override
  void initState() {
    super.initState();
    data =
        widget.data ??
        RecipeData(
          id: randomAlphaNumeric(16),
          title: "New recipe",
          imageName: null,
          steps: [],
        );

    titleController = TextEditingController(text: data.title);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddImageWidget(
              fileName: data.imageName,
              onChange: (fileName) => setState(() {
                data = data.copyWith(imageName: fileName);
              }),
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
          ],
        ),
      ),
    );
  }
}
