import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/file_modifier.dart/file_modifier_notifier.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/ai_url_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_mutation.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/dialogs/image_picker_dialog.dart';

class ImportScreen extends ConsumerWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final aiProvider = ref.watch(aiProviderProvider).value;
    final import = ref.watch(AiImportMutation.mutation);

    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: Center(
        child: import.isPending
            ? CircularProgressIndicator()
            : Column(
                mainAxisSize: .min,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: [".recipath"],
                      );

                      if (result != null && context.mounted) {
                        context.goRelative(
                          ImportRoutes.recipeImport.path,
                          extra: result.files.single.path,
                        );
                      }
                    },
                    icon: Icon(Icons.download),
                    label: Text(localization.importFile),
                  ),
                  if (aiProvider != null) ...[
                    if (aiProvider.provider.multimodal)
                      TextButton.icon(
                        onPressed: () async {
                          final xFile = await showDialog<XFile?>(
                            context: context,
                            builder: (context) => ImagePickerDialog(),
                          );

                          if (xFile != null) {
                            final appDirectory = ref.watch(
                              applicationPathProvider,
                            );
                            final fileModifier = ref.watch(
                              fileModifierProvider,
                            );
                            final bytes = await xFile.readAsBytes();

                            final compressed =
                                await FlutterImageCompress.compressWithList(
                                  bytes,
                                );

                            final result =
                                await AiImportMutation.runImageImport(
                                  ref,
                                  compressed,
                                );

                            if (result != null) {
                              final newFileName = randomAlphaNumeric(16);
                              final file = File(
                                "${appDirectory.path}/$newFileName",
                              );

                              await file.writeAsString(jsonEncode(result));
                              await fileModifier.add(newFileName);

                              if (context.mounted) {
                                context.goRelative(
                                  ImportRoutes.recipeImport.path,
                                  extra: file.path,
                                );
                              }
                            }
                          }
                        },
                        icon: Icon(Icons.auto_awesome),
                        label: Text(localization.importImage),
                      ),
                    TextButton.icon(
                      onPressed: () async {
                        final result = await showDialog<Map<String, dynamic>>(
                          context: context,
                          builder: (context) => AiUrlDialog(),
                        );

                        if (result != null) {
                          final appDirectory = ref.watch(
                            applicationPathProvider,
                          );
                          final fileModifier = ref.watch(fileModifierProvider);

                          final newFileName = randomAlphaNumeric(16);
                          final file = File(
                            "${appDirectory.path}/$newFileName",
                          );

                          await file.writeAsString(jsonEncode(result));
                          await fileModifier.add(newFileName);

                          if (context.mounted) {
                            context.goRelative(
                              ImportRoutes.recipeImport.path,
                              extra: file.path,
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.auto_awesome),
                      label: Text(localization.importUrl),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
