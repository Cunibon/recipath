import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/tag_modifier/tag_modifier_notifier.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/dialogs/select_color_dialog.dart';
import 'package:recipath/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:recipath/widgets/tag/tag.dart';

class CreateTagScreen extends ConsumerStatefulWidget {
  const CreateTagScreen({this.tagId, super.key});

  final String? tagId;

  @override
  ConsumerState<CreateTagScreen> createState() => _CreateTagScreenState();
}

class _CreateTagScreenState extends ConsumerState<CreateTagScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  late TagData initialData;
  late TagData data;

  @override
  void initState() {
    super.initState();
    final existingData = ref.read(tagProvider).value![widget.tagId];
    if (existingData == null) {
      final id = randomAlphaNumeric(16);
      initialData = TagData(
        id: id,
        name: "",
        description: "",
        color: getRandomColorBasedOnString(id),
      );
    } else {
      initialData = existingData;
    }
    data = initialData;
    nameController.text = data.name;
    descriptionController.text = data.description;
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return UnsavedChangesScope(
      canPop: data == initialData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.createGrocery,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  if (data != initialData) {
                    await ref.read(tagModifierProvider).add(data);
                  }
                  if (context.mounted) {
                    context.pop(data);
                  }
                }
              },
              icon: Icon(Icons.save),
              label: Text(localization.save),
            ),
            if (widget.tagId != null)
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => DeleteConfirmationDialog(),
                  );

                  if (context.mounted && result) {
                    ref.read(tagModifierProvider).delete(data);
                    context.pop();
                  }
                },
                icon: Icon(Icons.delete),
                label: Text(localization.delete),
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: localization.name),
                    maxLength: 20,
                    onChanged: (value) => setState(
                      () => data = data.copyWith(name: value.trim()),
                    ),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: localization.description,
                    ),
                    onChanged: (value) => setState(
                      () => data = data.copyWith(description: value),
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      final result = await showDialog<Color>(
                        context: context,
                        builder: (context) =>
                            SelectColorDialog(initialColor: data.color),
                      );

                      if (result != null) {
                        setState(() => data = data.copyWith(color: result));
                      }
                    },
                    child: Tag(
                      text: localization.changeColor,
                      color: data.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
