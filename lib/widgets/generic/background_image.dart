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

    return Column(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
              stops: [0.9, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: LocalImage(fileName: imageName!, fit: .cover),
          ),
        ),
        child,
      ],
    );
  }
}
