import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:recipe_list/widgets/main_screen/local_image.dart';

class AddImageWidget extends ConsumerWidget {
  const AddImageWidget({this.fileName, required this.onChange, super.key});
  final String? fileName;
  final void Function(String? fileName) onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (fileName != null) {
      return Stack(
        children: [
          LocalImage(fileName: fileName!),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () => onChange(null),
                icon: Icon(Icons.close),
              ),
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final xFile = await showDialog<XFile?>(
            context: context,
            builder: (context) => Column(
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a picture"),
                  onTap: () async => context.pop(
                    await picker.pickImage(source: ImageSource.camera),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Add a picture from gallery"),
                  onTap: () async => context.pop(
                    await picker.pickImage(source: ImageSource.gallery),
                  ),
                ),
              ],
            ),
          );

          if (xFile != null) {
            final appDirectory = await ref.watch(
              applicationPathProvider.future,
            );
            final bytes = await xFile.readAsBytes();
            final newFileName = randomAlphaNumeric(16);
            final file = File("${appDirectory.path}/$newFileName");

            await file.writeAsBytes(bytes);
            onChange(newFileName);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.camera_alt),
        ),
      );
    }
  }
}
