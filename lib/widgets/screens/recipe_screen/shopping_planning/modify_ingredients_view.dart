import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/ingredient_item.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/providers/grocey_storage_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';

class ModifyIngredientsView extends ConsumerWidget {
  const ModifyIngredientsView({
    required this.ingredientDataList,
    required this.onChange,
    super.key,
  });

  final List<IngredientData> ingredientDataList;

  final void Function(List<IngredientData> ingredientDataList) onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final asyncState = ref.watch(groceryStorageProvider);

    return CachedAsyncValueWrapper(
      asyncState: asyncState,
      builder: (state) {
        return SearchableList(
          listViewPadding: EdgeInsets.only(bottom: 12),
          name: localization.items,
          items: ingredientDataList,
          toSearchable: (item) => item.toReadable(
            grocery: state.groceryMap[item.groceryId]!,
            unitLocalized: unitLocalized,
            doubleNumberFormat: doubleNumberFormat,
          ),
          toWidget: (item) {
            final storageItem = ref.watch(storageModeProvider)
                ? state.storage[item.groceryId]
                : null;
            final inStorage =
                storageItem != null &&
                item.amount <= storageItem.ingredient.amount;

            return IngredientItem(
              key: Key(item.groceryId),
              data: item,
              style: inStorage
                  ? TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Colors.green[600])
                  : null,
              onChanged: (value) {
                final parsed = doubleNumberFormat.tryParse(value);
                if (parsed != null) {
                  final copy = List<IngredientData>.from(ingredientDataList);

                  final index = copy.indexOf(item);
                  copy.removeAt(index);
                  copy.insert(index, item.copyWith(amount: parsed.toDouble()));

                  onChange(copy);
                }
              },
            );
          },
          sort: (a, b) => state.groceryMap[a.groceryId]!.name.compareTo(
            state.groceryMap[b.groceryId]!.name,
          ),
          emptyState: EmptyState(),
        );
      },
    );
  }
}
