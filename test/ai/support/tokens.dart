import 'dart:convert';
import 'dart:io';

import 'package:recipath/data/ai_provider_enum.dart';

abstract class Tokens {
  static Map<String, String>? _cached;

  static String tokenEnvVar(AiProviderEnum provider) =>
      'RECIPATH_${provider.name.toUpperCase()}_TOKEN';

  static Map<String, String> _localFile() {
    if (_cached != null) return _cached!;

    final file = File('test/ai/tokens.local.json');
    if (!file.existsSync()) return _cached = const {};

    final decoded = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return _cached = decoded.map((k, v) => MapEntry(k, v.toString()));
  }

  static bool _isUsable(String? value) {
    if (value == null) return false;
    final trimmed = value.trim();
    return trimmed.length >= 16 && !trimmed.contains('...');
  }

  static bool _isPlaceholder(String? value) =>
      value != null && value.trim().isNotEmpty && !_isUsable(value);

  static String? of(AiProviderEnum provider) {
    const defines = String.fromEnvironment('RECIPATH_AI_TOKENS');
    if (defines.isNotEmpty) {
      final decoded = jsonDecode(defines) as Map<String, dynamic>;
      final value = decoded[provider.name]?.toString();
      if (_isUsable(value)) return value!.trim();
    }

    final env = Platform.environment[tokenEnvVar(provider)];
    if (_isUsable(env)) return env!.trim();

    final local = _localFile()[provider.name];
    if (_isUsable(local)) return local!.trim();

    return null;
  }

  static String? skipReason(AiProviderEnum provider) {
    if (of(provider) != null) return null;

    if (_isPlaceholder(_localFile()[provider.name]) ||
        _isPlaceholder(Platform.environment[tokenEnvVar(provider)])) {
      return 'placeholder token for "${provider.name}" — replace it with a real '
          'key in test/ai/tokens.local.json, or delete the line to skip cleanly';
    }

    return 'no token: add "${provider.name}" to test/ai/tokens.local.json '
        'or set ${tokenEnvVar(provider)}';
  }
}
