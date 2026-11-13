import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordError extends StatelessWidget {
  const ChangePasswordError({required this.error, super.key});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final error = this.error;

    final errorMessage = switch (error) {
      AuthException(code: 'same_password') => localization.samePassword,
      AuthException(code: 'weak_password') => localization.weakPassword,
      AuthException(code: 'reauthentication_needed') =>
        localization.reauthenticationNeeded,
      AuthException(code: 'over_request_rate_limit') ||
      AuthException(statusCode: '429') => localization.tooManyRequests,
      _ => localization.somethingWentWrong,
    };

    return Text(
      errorMessage,
      style: TextTheme.of(
        context,
      ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
    );
  }
}
