import 'package:flutter/material.dart';
import 'package:recipath/widgets/navigation/sync_state_button.dart';

enum SyncState { synced, unsynced }

class DefaultNavigationTitle extends StatelessWidget {
  const DefaultNavigationTitle({
    required this.title,
    required this.syncState,
    super.key,
  });
  final String title;
  final SyncState syncState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        if (syncState == SyncState.unsynced) SyncStateButton(),
      ],
    );
  }
}
