import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/common.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_customer_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  late bool loading = false;
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Dialog(
      child: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: SizedBox(
          width: 200,
          child: Form(
            key: formKey,
            child: AutofillGroup(
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isLogin ? localization.login : localization.register,
                    style: TextTheme.of(context).titleLarge,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: widget.isLogin
                        ? const [AutofillHints.username]
                        : const [AutofillHints.newUsername],
                    decoration: InputDecoration(hintText: localization.eMail),
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
                    ),
                    validator: (value) {
                      if (value == null) {
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
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        color: ColorScheme.of(context).error,
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() == true) {
                          TextInput.finishAutofillContext();

                          setState(() {
                            loading = true;
                            errorMessage = null;
                          });

                          final supabaseClient = ref.read(
                            supabaseClientProvider,
                          );

                          try {
                            late AuthResponse response;
                            if (widget.isLogin) {
                              response = await supabaseClient.auth
                                  .signInWithPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            } else {
                              response = await supabaseClient.auth.signUp(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }

                            if (response.session != null) {
                              await ref
                                  .read(revenueCustomerProvider.notifier)
                                  .login(response.user!.id);
                              await (await ref.read(
                                syncingServiceProvider.future,
                              )).reset();
                              if (context.mounted) {
                                context.pop();
                              }
                            } else {
                              setState(() {
                                errorMessage =
                                    localization.verifactionEMailSent;
                              });
                            }
                          } catch (e) {
                            if (e is AuthApiException) {
                              if (e.code == "invalid_credentials") {
                                setState(() {
                                  errorMessage =
                                      localization.couldNotAuthenticate;
                                });
                              }
                            }
                          } finally {
                            if (context.mounted) {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        }
                      },
                      child: loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              widget.isLogin
                                  ? localization.login
                                  : localization.register,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
