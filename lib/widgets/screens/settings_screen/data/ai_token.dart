import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/ai_token_dialog.dart';

class AiToken extends ConsumerWidget {
  const AiToken({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerData = ref.watch(aiProviderProvider).value;

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () async {
            final result = await showDialog<AiProviderData>(
              context: context,
              builder: (context) => AiTokenDialog(providerData: providerData),
            );

            if (result != null) {
              ref.read(aiProviderProvider.notifier).set(result);
            }
          },
          icon: Icon(Icons.auto_awesome),
          label: Text(AppLocalizations.of(context)!.aiToken),
        ),
        if (providerData != null)
          IconButton(
            onPressed: () => ref.read(aiProviderProvider.notifier).set(null),
            icon: Icon(Icons.delete),
          ),
      ],
    );
  }
}
