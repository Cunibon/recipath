import 'package:material_ui/material_ui.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class OpenFoodFactsAccountDialog extends StatefulWidget {
  const OpenFoodFactsAccountDialog({this.accountData, super.key});

  final OpenFoodFactsAccountData? accountData;

  @override
  State<OpenFoodFactsAccountDialog> createState() =>
      _OpenFoodFactsAccountDialogState();
}

class _OpenFoodFactsAccountDialogState
    extends State<OpenFoodFactsAccountDialog> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(
      text: widget.accountData?.username ?? '',
    );
    passwordController = TextEditingController(
      text: widget.accountData?.password ?? '',
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localization.openFoodFactsAccount),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.openFoodFactsAccountDescription,
                style: TextTheme.of(context).bodyMedium,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: localization.openFoodFactsUsername,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return localization.openFoodFactsUsernameRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: localization.openFoodFactsPassword,
                  prefixIcon: const Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return localization.openFoodFactsPasswordRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
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
      actions: [
        TextButton(
          child: Text(localization.actionCancel),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          child: Text(localization.save),
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              final account = OpenFoodFactsAccountData(
                username: usernameController.text.trim(),
                password: passwordController.text.trim(),
                appUuid: widget.accountData?.appUuid ?? Uuid().v4(),
              );
              Navigator.pop(context, account);
            }
          },
        ),
      ],
    );
  }
}
