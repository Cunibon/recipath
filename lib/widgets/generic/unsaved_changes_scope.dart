import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/generic/pop_confirmation_dialog.dart';

class UnsavedChangesScope extends StatelessWidget {
  const UnsavedChangesScope({
    required this.canPop,
    required this.child,
    super.key,
  });

  final bool canPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final result = await showDialog<bool>(
          context: context,
          builder: (context) => PopConfirmationDialog(),
        );

        if (context.mounted && result == true) {
          context.pop();
        }
      },
      child: child,
    );
  }
}
