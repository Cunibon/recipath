import 'dart:io';

import 'package:recipath/providers/application_path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_file_notifier.g.dart';

@riverpod
File localFileNotifier(Ref ref, String fileName) {
  final applicationPath = ref.watch(applicationPathProvider);
  final file = File("${applicationPath.path}/$fileName");

  return file;
}
