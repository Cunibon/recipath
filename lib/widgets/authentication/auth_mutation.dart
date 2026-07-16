import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/helper/bound_mutation.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_customer_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

final authMutation = BoundMutation<AuthResponse, AuthInput>((
  transaction,
  input,
) async {
  final supabaseClient = transaction.get(supabaseClientProvider);

  late AuthResponse response;
  if (input.isLogin) {
    response = await supabaseClient.auth.signInWithPassword(
      email: input.email,
      password: input.password,
    );
  } else {
    response = await supabaseClient.auth.signUp(
      email: input.email,
      password: input.password,
    );
  }

  if (response.session != null) {
    await transaction
        .get(revenueCustomerProvider.notifier)
        .login(response.user!.id);
    await transaction.get(syncingServiceProvider).reset();
  } else {
    final identities = response.user?.identities;
    if (identities == null || identities.isEmpty) {
      throw AuthApiException(
        "User already exists",
        code: "user_already_exists",
      );
    }
    throw AuthApiException(
      "Verification needed",
      code: "verification_needed",
    );
  }

  return response;
});
