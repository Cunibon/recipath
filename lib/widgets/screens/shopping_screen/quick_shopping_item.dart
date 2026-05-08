import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/quick_shopping_modifier/quick_shopping_modifier_notifier.dart';
import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/focus_form_field.dart';

class QuickShoppingItem extends ConsumerWidget {
  const QuickShoppingItem({required this.data, super.key});

  final QuickShoppingData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    void switchState() {
      final shoppingNotifier = ref.read(quickShoppingModifierProvider);

      shoppingNotifier.updateItem(data.copyWith(done: !data.done));
    }

    return GestureDetector(
      onTap: switchState,
      child: Card(
        color: data.done
            ? ColorScheme.of(context).surfaceContainerLowest
            : null,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Row(
            children: [
              IconButton(
                onPressed: switchState,
                icon: Icon(
                  data.done ? Icons.check_box : Icons.check_box_outline_blank,
                ),
              ),
              Expanded(
                child: FocusFormField(
                  key: Key(data.id),
                  textCapitalization: .sentences,
                  initialValue: data.description,
                  decoration: InputDecoration(
                    labelText: localization.description,
                  ),
                  onFocusLost: (value) {
                    if (value.isEmpty) {
                      ref.read(quickShoppingModifierProvider).deleteItem(data);
                    } else if (value != data.description) {
                      ref
                          .read(quickShoppingModifierProvider)
                          .updateItem(data.copyWith(description: value));
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  final result = data.done
                      ? true
                      : await showDialog(
                          context: context,
                          builder: (context) => DeleteConfirmationDialog(),
                        );

                  if (result == true) {
                    ref.read(quickShoppingModifierProvider).deleteItem(data);
                  }
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
