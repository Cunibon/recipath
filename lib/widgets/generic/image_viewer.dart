import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/local_file_notifier.dart';

class ImageViewer extends ConsumerWidget {
  const ImageViewer({required this.fileName, super.key});

  final String fileName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final child = LocalImage(fileName: fileName);

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black.withAlpha(180),
          body: Stack(
            children: [
              InteractiveViewer(
                clipBehavior: Clip.none,
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(child: child),
              ),
              Align(
                alignment: .topRight,
                child: SafeArea(
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () async {
                          final file = ref.read(localFileProvider(fileName));

                          try {
                            await Gal.putImageBytes(
                              await file.readAsBytes(),
                              name: "$fileName.jpg",
                            );

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(localization.imageSaved),
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    localization.somethingWentWrong,
                                  ),
                                ),
                              );
                            }
                            rethrow;
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => context.pop(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
