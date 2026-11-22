enum AuthFailureReason {
  invalidCredentials,
  verificationNeeded,
  userAlreadyExists,
  samePassword,
  weakPassword,
  reauthenticationNeeded,
  tooManyRequests,
}

class AuthFailure implements Exception {
  const AuthFailure(this.reason);

  final AuthFailureReason reason;

  @override
  String toString() => "AuthFailure(${reason.name})";
}
