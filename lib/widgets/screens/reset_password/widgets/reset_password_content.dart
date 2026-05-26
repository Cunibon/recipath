import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';

class ResetPasswordContent extends StatelessWidget {
  const ResetPasswordContent({
    required this.errorWidget,
    required this.passwordController,
    super.key,
  });

  final Widget? errorWidget;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AutofillGroup(
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: passwordController,
            autofillHints: const [AutofillHints.newPassword],
            obscureText: true,
            decoration: InputDecoration(hintText: localization.password),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.addPassword;
              }
              return null;
            },
          ),

          TextFormField(
            obscureText: true,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(hintText: localization.repeatPassword),
            validator: (value) {
              if (value != null) {
                if (value.length >= 12) {
                  if (passwordController.text == value) {
                    return null;
                  } else {
                    return localization.passwordsDontMatch;
                  }
                } else {
                  return localization.passwordLength;
                }
              } else {
                return localization.addPassword;
              }
            },
          ),
          ?errorWidget,
        ],
      ),
    );
  }
}
