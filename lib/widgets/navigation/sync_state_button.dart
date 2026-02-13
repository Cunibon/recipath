import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';

class SyncStateButton extends ConsumerStatefulWidget {
  const SyncStateButton({super.key});

  @override
  ConsumerState<SyncStateButton> createState() => _SyncStateButtonState();
}

class _SyncStateButtonState extends ConsumerState<SyncStateButton> {
  late bool loading = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (loading == true) return;

        setState(() => loading = true);
        ref.read(syncingServiceProvider).sync();
        if (context.mounted) {
          setState(() => loading = false);
        }
      },
      icon: Icon(loading ? Icons.cloud : Icons.cloud_upload),
    );
  }
}
