import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';

abstract class AuthService {
  AuthUser? get currentUser;
  Stream<AuthUser?> get userChanges;

  Future<AuthUser> signIn({required String email, required String password});
  Future<AuthUser> signUp({required String email, required String password});
  Future<void> signOut();

  Future<void> sendPasswordReset(String email);
  Future<AuthUser?> verifyPasswordReset({
    required String email,
    required String token,
  });
  Future<void> changePassword(String password);
}
