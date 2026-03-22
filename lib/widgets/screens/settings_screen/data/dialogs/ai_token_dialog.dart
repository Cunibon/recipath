import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/ai/ai_model_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

final _handshake = Mutation<ChatResult>();

class AiTokenDialog extends ConsumerStatefulWidget {
  const AiTokenDialog({required this.providerData, super.key});

  final AiProviderData? providerData;

  @override
  ConsumerState<AiTokenDialog> createState() => _AiTokenDialogState();
}

class _AiTokenDialogState extends ConsumerState<AiTokenDialog> {
  final formKey = GlobalKey<FormState>();
  final tokenController = TextEditingController();

  AiProviderEnum? selectedProvider;

  @override
  void initState() {
    super.initState();
    selectedProvider = widget.providerData?.provider;
  }

  @override
  void dispose() {
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final handshakeState = ref.watch(_handshake);

    return AlertDialog(
      title: Text(localization.addAiTokenDescription),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            DropdownMenuFormField(
              width: double.infinity,
              initialSelection: selectedProvider,
              hintText: localization.aiProvider,
              dropdownMenuEntries: [
                for (final value in AiProviderEnum.values)
                  DropdownMenuEntry(value: value, label: value.displayName),
              ],
              validator: (value) {
                if (value == null) {
                  return localization.selectAiProvider;
                }
                return null;
              },
              onSelected: (value) => setState(() => selectedProvider = value),
            ),
            if (selectedProvider != null)
              TextButton(
                onPressed: () =>
                    launchUrl(Uri.parse(selectedProvider!.tokenUrl)),
                child: Text(localization.createATokenHere),
              ),
            TextFormField(
              obscureText: true,
              controller: tokenController,
              decoration: InputDecoration(hintText: localization.aiToken),
              validator: (value) {
                if (value == null) {
                  return localization.addAiToken;
                }
                return null;
              },
            ),
            if (handshakeState is MutationError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  localization.somethingWentWrong,
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(localization.actionCancel),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          child: handshakeState is MutationPending
              ? CircularProgressIndicator()
              : Text(localization.save),
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              final providerData = AiProviderData(
                token: tokenController.text,
                provider: selectedProvider!,
              );

              await _handshake.run(ref, (transaction) async {
                final model = transaction.get(aiModelProvider(providerData))!;

                return await model.invoke(
                  PromptValue.string("ping"),
                  options: providerData.provider.handshakeOptions,
                );
              });

              if (context.mounted) {
                Navigator.pop(context, providerData);
              }
            }
          },
        ),
      ],
    );
  }
}
