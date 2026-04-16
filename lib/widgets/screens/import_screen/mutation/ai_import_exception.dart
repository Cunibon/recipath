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

  const AiImportException(this.type, {this.statusCode});

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
      return const AiImportException(AiImportErrorType.parseError);
    }

    final code = _extractStatusCode(error);
    if (code != null) {
      if (code == 429) {
        return const AiImportException(AiImportErrorType.rateLimited);
      }
      if (code == 401 || code == 403) {
        return const AiImportException(AiImportErrorType.authError);
      }
      if (code >= 500) {
        return AiImportException(
          AiImportErrorType.serverError,
          statusCode: code,
        );
      }
    }

    final typeName = error.runtimeType.toString();
    if (typeName.contains('SocketException') ||
        typeName.contains('ClientException') ||
        typeName.contains('TimeoutException') ||
        typeName.contains('HandshakeException')) {
      return const AiImportException(AiImportErrorType.networkError);
    }

    return const AiImportException(AiImportErrorType.unknown);
  }

  static AiImportException classifyUrlError(Object error) {
    final classified = classify(error);
    if (classified.type == AiImportErrorType.unknown ||
        classified.type == AiImportErrorType.networkError) {
      return const AiImportException(AiImportErrorType.urlLoadError);
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
}
