import 'package:genkit/genkit.dart';
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
    if (error is FormatException) {
      return AiImportException(AiImportErrorType.parseError, error);
    }

    if (error is GenkitException) {
      final inner = error.underlyingException;
      if (inner != null && _looksLikeNetwork(inner)) {
        return AiImportException(AiImportErrorType.networkError, error);
      }

      return switch (error.status) {
        StatusCodes.RESOURCE_EXHAUSTED => AiImportException(
          AiImportErrorType.rateLimited,
          error,
        ),
        StatusCodes.UNAUTHENTICATED ||
        StatusCodes.PERMISSION_DENIED ||
        StatusCodes.INVALID_ARGUMENT => AiImportException(
          AiImportErrorType.authError,
          error,
        ),
        StatusCodes.INTERNAL ||
        StatusCodes.UNAVAILABLE ||
        StatusCodes.DEADLINE_EXCEEDED ||
        StatusCodes.UNKNOWN => AiImportException(
          AiImportErrorType.serverError,
          error,
          statusCode: error.status.httpStatus,
        ),
        _ => AiImportException(AiImportErrorType.unknown, error),
      };
    }

    if (_looksLikeNetwork(error)) {
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

  static bool _looksLikeNetwork(Object error) {
    final typeName = error.runtimeType.toString();
    return typeName.contains('SocketException') ||
        typeName.contains('ClientException') ||
        typeName.contains('ConnectionException') ||
        typeName.contains('TimeoutException') ||
        typeName.contains('HandshakeException');
  }

  @override
  String toString() {
    return "$type, $statusCode: $error";
  }
}
