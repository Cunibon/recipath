import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';

enum ShareType { pdf, file }

class ShareTypeDialog extends StatelessWidget {
  const ShareTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(32),
            ),
            leading: Icon(Icons.file_copy),
            title: Text(localization.shareFile),
            onTap: () async => context.pop(ShareType.file),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(32),
            ),
            leading: Icon(Icons.picture_as_pdf),
            title: Text(localization.sharePdf),
            onTap: () async => context.pop(ShareType.pdf),
          ),
        ],
      ),
    );
  }
}
