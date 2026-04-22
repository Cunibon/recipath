import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/file_modifier.dart/file_modifier_notifier.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/dialogs/image_picker_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';

class AddImageWidget extends ConsumerWidget {
  const AddImageWidget({this.fileName, required this.onChanged, super.key});
  final String? fileName;
  final void Function(String? fileName) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          final xFile = await showDialog<XFile?>(
            context: context,
            builder: (context) => ImagePickerDialog(),
          );

          if (xFile != null) {
            final appDirectory = ref.watch(applicationPathProvider);
            final fileModifier = ref.watch(fileModifierProvider);
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
