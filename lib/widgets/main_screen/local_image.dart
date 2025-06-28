import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/main_screen/providers/file_provider.dart';

class LocalImage extends ConsumerWidget {
  const LocalImage({
    required this.fileName,
    this.width,
    this.height,
    super.key,
  });
  final String fileName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(localFileProvider(fileName));

    switch (asyncValue) {
      case AsyncData(:final value):
        return Image.file(value, width: width, height: height);
      case AsyncError():
        return const Text('Oops, something unexpected happened');
      default:
        return Center(child: const CircularProgressIndicator());
    }
  }
}
