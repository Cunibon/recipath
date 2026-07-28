import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';

class ReactiveImage extends ConsumerWidget {
  const ReactiveImage({
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

    final width = MediaQuery.sizeOf(context).width;
    final wide = width >= 800;

    return Flex(
      direction: wide ? .horizontal : .vertical,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        SizedBox(
          width: wide ? width / 2 : double.infinity,
          height: wide ? 300 : 200,
          child: LocalImage(fileName: imageName!, fit: .cover),
        ),
        Flexible(flex: wide ? 1 : 0, child: child),
      ],
    );
  }
}
