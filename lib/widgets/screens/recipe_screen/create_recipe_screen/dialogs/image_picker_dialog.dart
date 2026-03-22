import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipath/l10n/app_localizations.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ImagePicker picker = ImagePicker();

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(32),
            ),
            leading: Icon(Icons.camera_alt),
            title: Text(localization.takePicture),
            onTap: () async =>
                context.pop(await picker.pickImage(source: ImageSource.camera)),
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
    );
  }
}
