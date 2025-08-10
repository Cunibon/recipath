import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipe_list/widgets/providers/supabase/supabase_client_notifier.dart';
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

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: SizedBox(
          width: 200,
          child: Form(
            key: formKey,
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isLogin ? "Login" : "Register",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextFormField(
                  controller: emailController,

                  decoration: InputDecoration(hintText: "E-Mail"),
                  validator: (value) {
                    if (value != null) {
                      if (emailRegex.hasMatch(value)) {
                        return null;
                      } else {
                        return "E-Mail invalid";
                      }
                    } else {
                      return "Add an email";
                    }
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value == null) {
                      return "Add a password";
                    }
                    return null;
                  },
                ),
                if (!widget.isLogin)
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Repeat password"),
                    validator: (value) {
                      if (value != null) {
                        if (value.length >= 12) {
                          if (passwordController.text == value) {
                            return null;
                          } else {
                            return "Passwords dont match";
                          }
                        } else {
                          return "Password needs to be at least 12 letters long";
                        }
                      } else {
                        return "Repeat your password";
                      }
                    },
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() == true) {
                        setState(() {
                          loading = true;
                        });

                        final supabaseClient = ref.read(supabaseClientProvider);

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
                                .read(syncingServiceNotifierProvider)
                                .reset();
                            if (context.mounted) {
                              context.pop();
                            }
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Could not authenticate user"),
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          logger.e(e);
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
                        : Text(widget.isLogin ? "Login" : "Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
