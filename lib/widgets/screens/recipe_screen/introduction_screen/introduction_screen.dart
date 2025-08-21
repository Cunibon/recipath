import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: DefaultNavigationTitle(
          title: localization.introduction,
          syncState: SyncState.synced,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 20),
        child: MarkdownWidget(data: localization.appIntroduction),
      ),
    );
  }
}
