import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/open_food_facts_credential_mutation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class OpenFoodFactsAccountDialog extends ConsumerStatefulWidget {
  const OpenFoodFactsAccountDialog({this.accountData, super.key});

  final OpenFoodFactsAccountData? accountData;

  @override
  ConsumerState<OpenFoodFactsAccountDialog> createState() =>
      _OpenFoodFactsAccountDialogState();
}

class _OpenFoodFactsAccountDialogState
    extends ConsumerState<OpenFoodFactsAccountDialog> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.accountData?.username ?? '';
    passwordController.text = widget.accountData?.password ?? '';
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    final account = OpenFoodFactsAccountData(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
      appUuid: widget.accountData?.appUuid ?? Uuid().v4(),
    );

    final result = await credentialsCheck.run(ref, account);

    if (mounted && result == .valid) {
      Navigator.pop(context, account);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final credentialsState = ref.watch(credentialsCheck);

    return AlertDialog(
      title: Text(localization.openFoodFactsAccount),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: AutofillGroup(
            onDisposeAction: AutofillContextAction.cancel,
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.openFoodFactsAccountDescription,
                  style: TextTheme.of(context).bodyMedium,
                ),
                TextFormField(
                  controller: usernameController,
                  autofillHints: const [AutofillHints.username],
                  decoration: InputDecoration(
                    labelText: localization.username,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return localization.addUsername;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  decoration: InputDecoration(
                    labelText: localization.password,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return localization.addPassword;
                    }
                    return null;
                  },
                ),
                if (credentialsState case MutationError(:final error))
                  Text(
                    error is OpenFoodFactsInvalidCredentialsException
                        ? localization.openFoodFactsCredentialsInvalid
                        : localization.openFoodFactsCredentialsCheckFailed,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: ColorScheme.of(context).error,
                    ),
                  ),
                TextButton(
                  onPressed: () => launchUrl(
                    Uri.parse('https://world.openfoodfacts.org/cgi/user.pl'),
                  ),
                  child: Text(localization.registerOnOpenFoodFacts),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: credentialsState.isPending
              ? null
              : () {
                  Navigator.pop(context, null);
                },
          child: Text(localization.actionCancel),
        ),
        TextButton(
          onPressed: credentialsState.isPending ? null : save,
          child: credentialsState.isPending
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(localization.save),
        ),
      ],
    );
  }
}
