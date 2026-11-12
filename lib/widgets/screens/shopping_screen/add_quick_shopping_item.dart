import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/quick_shopping_modifier/quick_shopping_modifier_notifier.dart';
import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/normed_dotted_border.dart';

class AddQuickShoppingItem extends ConsumerStatefulWidget {
  const AddQuickShoppingItem({super.key});

  @override
  ConsumerState<AddQuickShoppingItem> createState() =>
      _AddQuickShoppingItemState();
}

class _AddQuickShoppingItemState extends ConsumerState<AddQuickShoppingItem> {
  final formkey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();

  Future<void> addNew() async {
    if (formkey.currentState?.validate() == true) {
      await ref
          .read(quickShoppingModifierProvider)
          .add(
            QuickShoppingData(
              id: randomAlphaNumeric(16),
              done: false,
              description: descriptionController.text,
            ),
          );

      descriptionController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: NormedDottedBorder(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: descriptionController,
                  textCapitalization: .sentences,
                  decoration: InputDecoration(
                    labelText: localization.addOtherItem,
                  ),
                  onFieldSubmitted: (_) => addNew(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.addDescription;
                    }
                    return null;
                  },
                ),
              ),
              IconButton(onPressed: () => addNew(), icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
