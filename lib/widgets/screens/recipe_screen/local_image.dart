import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/supabase_buckets.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/file_notifier.dart';

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
    final asyncValue = ref.watch(
      localFileProvider(
        bucket: SupabaseBuckets.recipeImage,
        fileName: fileName,
      ),
    );

    switch (asyncValue) {
      case AsyncData(:final value):
        return ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: Image.file(
            value,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) => SizedBox(
              width: 200,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
        );
      case AsyncError():
        return const Text('Oops, something unexpected happened');
      default:
        return Center(child: const CircularProgressIndicator());
    }
  }
}
