import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({
    super.key,
    required this.imageName,
    required this.child,
  });

  final String? imageName;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasImage = imageName != null;

    if (!hasImage) {
      return child;
    }

    final backgroundColor = ColorScheme.of(
      context,
    ).surfaceContainer.withAlpha(230);

    return Stack(
      alignment: .bottomCenter,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: LocalImage(fileName: imageName!, fit: .cover),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [backgroundColor.withAlpha(0), backgroundColor],
                ),
              ),
            ),
            ColoredBox(color: backgroundColor, child: child),
          ],
        ),
      ],
    );
  }
}
