import 'dart:io';

import 'package:recipath/widgets/providers/backend/backend_config_notifier.dart';
import 'package:recipath/domain_service/backend/remote_store/remote_store_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/local_file_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'bucket_file_notifier.g.dart';

@riverpod
Future<File> bucketFileNotifier(
  Ref ref, {
  required String bucket,
  required String fileName,
}) async {
  final file = ref.watch(localFileProvider(fileName));

  final backendConfig = await ref.watch(backendConfigProvider.future);

  if (backendConfig != null && !(await file.exists())) {
    final remoteStore = await ref.watch(remoteStoreProvider.future);

    try {
      final fileBytes = await remoteStore.downloadFile(
        bucket: bucket,
        fileName: fileName,
      );

      await file.writeAsBytes(fileBytes);
    } catch (e) {
      Sentry.captureException(e);
    }
  }

  return file;
}
