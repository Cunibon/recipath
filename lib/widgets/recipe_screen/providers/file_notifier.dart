import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_notifier.g.dart';

@Riverpod(dependencies: [applicationPath])
Future<File> localFile(Ref ref, String file) async {
  final applicationPath = await ref.watch(applicationPathProvider.future);
  return File("${applicationPath.path}/$file");
}
