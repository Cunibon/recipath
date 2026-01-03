import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/dialogs/cancel_shopping_planning_dialog.dart';

class CancelShoppingPlanning extends ConsumerWidget {
  const CancelShoppingPlanning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final cancel = await showDialog<bool>(
          context: context,
          builder: (context) => CancelShoppingPlanningDialog(),
        );

        if (cancel == true) {
          ref.read(shoppingPlanningProvider.notifier).clear();
        }
      },
      icon: Icon(Icons.clear),
    );
  }
}
