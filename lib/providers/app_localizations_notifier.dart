import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_localizations_notifier.g.dart';

@riverpod
Future<AppLocalizations> appLocalizationsNotifier(Ref ref) =>
    AppLocalizations.delegate.load(ref.watch(localeProvider));
