import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:recipath/widgets/providers/subscription/pro_notifier.dart';

class AuthInput {
  AuthInput({
    required this.email,
    required this.password,
    required this.isLogin,
  });

  final String email;
  final String password;
  final bool isLogin;
}

final authMutation = BoundMutation<AuthUser, AuthInput>((
  transaction,
  input,
) async {
  final authService = await transaction.get(authServiceProvider.future);

  final user = input.isLogin
      ? await authService.signIn(email: input.email, password: input.password)
      : await authService.signUp(email: input.email, password: input.password);

  await transaction.get(proProvider.notifier).login(user.id);
  await transaction.get(syncingServiceProvider).reset();

  return user;
});
