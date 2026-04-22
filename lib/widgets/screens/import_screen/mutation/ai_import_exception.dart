import 'package:langchain/langchain.dart';
import 'package:recipath/l10n/app_localizations.dart';

enum AiImportErrorType {
  serverError,
  authError,
  rateLimited,
  networkError,
  urlLoadError,
  parseError,
  unknown,
}

class AiImportException implements Exception {
  final AiImportErrorType type;
  final int? statusCode;
  final Object error;

  const AiImportException(this.type, this.error, {this.statusCode});

  String localizedMessage(AppLocalizations l) => switch (type) {
    AiImportErrorType.serverError => l.aiErrorServer(statusCode ?? 500),
    AiImportErrorType.authError => l.aiErrorAuth,
    AiImportErrorType.rateLimited => l.aiErrorRateLimit,
    AiImportErrorType.networkError => l.aiErrorNetwork,
    AiImportErrorType.urlLoadError => l.aiErrorUrlLoad,
    AiImportErrorType.parseError => l.aiErrorParse,
    AiImportErrorType.unknown => l.somethingWentWrong,
  };

  static AiImportException classify(Object error) {
    if (error is LangChainException) {
      return AiImportException(AiImportErrorType.parseError, error);
    }

    final code = _extractStatusCode(error);
    if (code != null) {
      if (code == 429) {
        return AiImportException(AiImportErrorType.rateLimited, error);
      }
      if (code == 401 || code == 403) {
        return AiImportException(AiImportErrorType.authError, error);
      }
      if (code >= 500) {
        return AiImportException(
          AiImportErrorType.serverError,
          error,
          statusCode: code,
        );
      }
    }

    final typeName = error.runtimeType.toString();
    if (typeName.contains('SocketException') ||
        typeName.contains('ClientException') ||
        typeName.contains('TimeoutException') ||
        typeName.contains('HandshakeException')) {
      return AiImportException(AiImportErrorType.networkError, error);
    }

    return AiImportException(AiImportErrorType.unknown, error);
  }

  static AiImportException classifyUrlError(Object error) {
    final classified = classify(error);
    if (classified.type == AiImportErrorType.unknown ||
        classified.type == AiImportErrorType.networkError) {
      return AiImportException(AiImportErrorType.urlLoadError, error);
    }
    return classified;
  }

  static int? _extractStatusCode(Object error) {
    try {
      return (error as dynamic).code as int?;
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return "$type, $statusCode: $error";
  }
}
