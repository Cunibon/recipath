import 'package:recipath/helper/bound_mutation.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final changePasswordMutation = BoundMutation<UserResponse, String>((
  transaction,
  input,
) async {
  final supabaseClient = transaction.get(supabaseClientProvider);

  return await supabaseClient.auth.updateUser(UserAttributes(password: input));
});
