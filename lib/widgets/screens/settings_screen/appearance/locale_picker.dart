import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';

class LocalePicker extends ConsumerWidget {
  const LocalePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          DropdownButton<String>(
            value: locale.languageCode,
            items: AppLocalizations.supportedLocales
                .map(
                  (e) => DropdownMenuItem(
                    value: e.languageCode,
                    child: Text(e.languageCode),
                  ),
                )
                .toList(),
            onChanged: (value) => ref.read(localeProvider.notifier).set(value!),
          ),
        ],
      ),
    );
  }
}
