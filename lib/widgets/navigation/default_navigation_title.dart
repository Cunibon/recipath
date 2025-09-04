import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/navigation/sync_state_button.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';

enum SyncState { synced, unsynced }

class DefaultNavigationTitle extends ConsumerWidget {
  const DefaultNavigationTitle({
    required this.title,
    required this.syncState,
    super.key,
  });
  final String title;
  final SyncState syncState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        if (ref.watch(supabaseUserProvider) != null)
          if (syncState == SyncState.unsynced) SyncStateButton(),
      ],
    );
  }
}
