import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/file_modifier.dart/file_modifier_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';

class AddImageWidget extends ConsumerWidget {
  const AddImageWidget({this.fileName, required this.onChanged, super.key});
  final String? fileName;
  final void Function(String? fileName) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    if (fileName != null) {
      return IntrinsicWidth(
        child: Stack(
          children: [
            LocalImage(fileName: fileName!),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => onChanged(null),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final xFile = await showDialog<XFile?>(
            context: context,
            builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(32),
                    ),
                    leading: Icon(Icons.camera_alt),
                    title: Text(localization.takePicture),
                    onTap: () async => context.pop(
                      await picker.pickImage(source: ImageSource.camera),
                    ),
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(32),
                    ),
                    leading: Icon(Icons.image),
                    title: Text(localization.addPictureFromGallery),
                    onTap: () async => context.pop(
                      await picker.pickImage(source: ImageSource.gallery),
                    ),
                  ),
                ],
              ),
            ),
          );

          if (xFile != null) {
            final appDirectory = ref.watch(applicationPathProvider);
            final fileModifier = ref.watch(fileModifierNotifierProvider);
            final bytes = await xFile.readAsBytes();

            final compressed = await FlutterImageCompress.compressWithList(
              bytes,
            );

            final newFileName = randomAlphaNumeric(16);
            final file = File("${appDirectory.path}/$newFileName");

            await file.writeAsBytes(compressed);
            await fileModifier.add(newFileName);

            onChanged(newFileName);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(Icons.camera_alt),
          ),
        ),
      );
    }
  }
}
