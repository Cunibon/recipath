import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';

final changePasswordMutation = BoundMutation<void, String>((
  transaction,
  input,
) async {
  final authService = await transaction.get(authServiceProvider.future);

  await authService.changePassword(input);
});
