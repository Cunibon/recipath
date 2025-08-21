import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_notifier.g.dart';

@riverpod
Future<File> localFile(
  Ref ref, {
  required String bucket,
  required String fileName,
}) async {
  final applicationPath = ref.watch(applicationPathProvider);

  final file = File("${applicationPath.path}/$fileName");

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
