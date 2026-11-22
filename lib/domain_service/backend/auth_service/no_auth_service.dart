import 'package:recipath/domain_service/backend/auth_service/auth_service.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';

class NoAuthService implements AuthService {
  @override
  AuthUser? get currentUser => null;

  @override
  Stream<AuthUser?> get userChanges => const Stream.empty();

  @override
  Future<AuthUser> signIn({required String email, required String password}) =>
      throw UnsupportedError("No backend configured");

  @override
  Future<AuthUser> signUp({required String email, required String password}) =>
      throw UnsupportedError("No backend configured");

  @override
  Future<void> signOut() async {}

  @override
  Future<void> sendPasswordReset(String email) =>
      throw UnsupportedError("No backend configured");

  @override
  Future<AuthUser?> verifyPasswordReset({
    required String email,
    required String token,
  }) => throw UnsupportedError("No backend configured");

  @override
  Future<void> changePassword(String password) =>
      throw UnsupportedError("No backend configured");
}
