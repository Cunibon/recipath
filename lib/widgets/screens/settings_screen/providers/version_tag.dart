import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/package_info_provider.dart';

class VersionTag extends ConsumerWidget {
  const VersionTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedAsyncValueWrapper(
      asyncState: ref.watch(packageInfoNotifierProvider),
      builder: (data) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${AppLocalizations.of(context)!.version}: ${data.version}+${data.buildNumber}",
        ),
      ),
    );
  }
}
