class AssemblyResult {
  AssemblyResult();

  final Map<String, ({Object error, StackTrace stacktrace})> _errors = {};
  Map<String, ({Object error, StackTrace stacktrace})> get errors =>
      Map.from(_errors);

  bool get success => _errors.isEmpty;

  void addError({
    required String id,
    required Object error,
    required StackTrace stacktrace,
  }) {
    _errors[id] = (error: error, stacktrace: stacktrace);
  }
}
