import 'dart:io';

import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/local_file_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bucket_file_notifier.g.dart';

@riverpod
Future<File> bucketFileNotifier(
  Ref ref, {
  required String bucket,
  required String fileName,
}) async {
  final file = ref.watch(localFileProvider(fileName));

  if (!(await file.exists())) {
    final supabaseClient = ref.watch(supabaseClientProvider);

    try {
      final fileBytes = await supabaseClient.storage
          .from(bucket)
          .download(fileName);

      await file.writeAsBytes(fileBytes);
    } catch (_) {}
  }

  return file;
}
