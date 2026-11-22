import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/common.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_failure.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/authentication/auth_mutation.dart';

class AuthDialog extends ConsumerStatefulWidget {
  const AuthDialog({required this.isLogin, super.key});

  final bool isLogin;

  @override
  ConsumerState<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends ConsumerState<AuthDialog> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final authStatus = ref.watch(authMutation);

    Widget? errorWidget;

    if (authStatus.hasError) {
      final error = (authStatus as MutationError).error;

      String errorMessage = localization.somethingWentWrong;

      if (error is AuthFailure) {
        errorMessage = switch (error.reason) {
          .invalidCredentials => localization.couldNotAuthenticate,
          .verificationNeeded => localization.verifactionEMailSent,
          .userAlreadyExists => localization.userAlreadyExists,
          _ => errorMessage,
        };
      }

      errorWidget = Text(
        errorMessage,
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
      );
    }

    return AlertDialog(
      title: Text(widget.isLogin ? localization.login : localization.register),
      content: Form(
        key: formKey,
        child: AutofillGroup(
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: widget.isLogin
                    ? const [AutofillHints.username]
                    : const [AutofillHints.newUsername],
                decoration: InputDecoration(
                  hintText: localization.eMail,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value != null) {
                    if (emailRegex.hasMatch(value)) {
                      return null;
                    } else {
                      return localization.objectInvalid(localization.eMail);
                    }
                  } else {
                    return localization.addEMail;
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                obscureText: true,
                decoration: InputDecoration(
                  hintText: localization.password,
                  prefixIcon: const Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localization.addPassword;
                  }
                  return null;
                },
              ),
              if (!widget.isLogin)
                TextFormField(
                  obscureText: true,
                  autofillHints: const [AutofillHints.newPassword],
                  decoration: InputDecoration(
                    hintText: localization.repeatPassword,
                  ),
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
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.go(RootRoutes.resetPasswordRoute.path),
          child: Text(localization.resetPassword),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              TextInput.finishAutofillContext();

              await authMutation.run(
                ref,
                AuthInput(
                  email: emailController.text,
                  password: passwordController.text,
                  isLogin: widget.isLogin,
                ),
              );

              if (context.mounted) {
                context.pop();
              }
            }
          },
          child: authStatus is MutationPending
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  widget.isLogin ? localization.login : localization.register,
                ),
        ),
      ],
    );
  }
}
