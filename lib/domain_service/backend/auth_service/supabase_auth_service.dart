import 'package:recipath/domain_service/backend/auth_service/auth_failure.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;

class SupabaseAuthService implements AuthService {
  SupabaseAuthService(this._client);

  final SupabaseClient _client;

  @override
  AuthUser? get currentUser => _toAuthUser(_client.auth.currentUser);

  @override
  Stream<AuthUser?> get userChanges => _client.auth.onAuthStateChange.map(
    (state) => _toAuthUser(state.session?.user),
  );

  @override
  Future<AuthUser> signIn({required String email, required String password}) =>
      _mapFailures(
        () async => _requireSession(
          await _client.auth.signInWithPassword(
            email: email,
            password: password,
          ),
        ),
      );

  @override
  Future<AuthUser> signUp({required String email, required String password}) =>
      _mapFailures(
        () async => _requireSession(
          await _client.auth.signUp(email: email, password: password),
        ),
      );

  @override
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } on AuthException {
      if (_client.auth.currentSession != null) rethrow;
    }
  }

  @override
  Future<void> sendPasswordReset(String email) =>
      _mapFailures(() => _client.auth.resetPasswordForEmail(email));

  @override
  Future<AuthUser?> verifyPasswordReset({
    required String email,
    required String token,
  }) => _mapFailures(() async {
    final response = await _client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.recovery,
    );

    return response.session == null ? null : _toAuthUser(response.user);
  });

  @override
  Future<void> changePassword(String password) => _mapFailures(
    () => _client.auth.updateUser(UserAttributes(password: password)),
  );

  AuthUser? _toAuthUser(User? user) =>
      user == null ? null : AuthUser(id: user.id, email: user.email);

  AuthUser _requireSession(AuthResponse response) {
    final user = response.user;
    if (response.session != null && user != null) return _toAuthUser(user)!;

    final identities = user?.identities;
    if (identities == null || identities.isEmpty) {
      throw const AuthFailure(.userAlreadyExists);
    }
    throw const AuthFailure(.verificationNeeded);
  }

  Future<T> _mapFailures<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on AuthException catch (error) {
      final reason = _reasonFor(error);
      if (reason == null) rethrow;
      throw AuthFailure(reason);
    }
  }

  AuthFailureReason? _reasonFor(AuthException error) => switch (error) {
    AuthException(code: 'invalid_credentials') => .invalidCredentials,
    AuthException(code: 'user_already_exists') ||
    AuthException(code: 'email_exists') => .userAlreadyExists,
    AuthException(code: 'same_password') => .samePassword,
    AuthException(code: 'weak_password') => .weakPassword,
    AuthException(code: 'reauthentication_needed') => .reauthenticationNeeded,
    AuthException(code: 'over_request_rate_limit') ||
    AuthException(statusCode: '429') => .tooManyRequests,
    _ => null,
  };
}
