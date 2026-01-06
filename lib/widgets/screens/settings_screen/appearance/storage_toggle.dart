import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';
import 'package:recipath/widgets/screens/settings_screen/setting_toggle.dart';

class StorageToggle extends ConsumerWidget {
  const StorageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageMode = ref.watch(storageModeProvider);

    return SettingToggle(
      text: AppLocalizations.of(context)!.storageMode,
      value: storageMode,
      onChanged: (value) => ref.read(storageModeProvider.notifier).set(value),
    );
  }
}
