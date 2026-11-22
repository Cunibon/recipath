import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user_notifier.g.dart';

@riverpod
Stream<AuthUser?> authUser(Ref ref) async* {
  final authService = await ref.watch(authServiceProvider.future);

  yield authService.currentUser;
  yield* authService.userChanges;
}
