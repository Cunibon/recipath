import 'package:material_ui/material_ui.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_failure.dart';
import 'package:recipath/l10n/app_localizations.dart';

class ChangePasswordError extends StatelessWidget {
  const ChangePasswordError({required this.error, super.key});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final error = this.error;

    final errorMessage = switch (error) {
      AuthFailure(reason: .samePassword) => localization.samePassword,
      AuthFailure(reason: .weakPassword) => localization.weakPassword,
      AuthFailure(reason: .reauthenticationNeeded) =>
        localization.reauthenticationNeeded,
      AuthFailure(reason: .tooManyRequests) => localization.tooManyRequests,
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
