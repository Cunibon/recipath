import 'dart:io';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service.dart';
import 'package:recipath/domain_service/backend/remote_store/remote_store.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/bucket_repo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FileSyncOrchestrator {
  FileSyncOrchestrator({
    required this.remoteStore,
    required this.authService,
    required this.bucketRepos,
    required this.filePath,
  });

  final RemoteStore remoteStore;
  final AuthService authService;

  final List<BucketRepo> bucketRepos;
  final String filePath;

  final logger = Logger();

  Future<int> uploadAll() async {
    if (authService.currentUser == null) return 0;

    int uploaded = 0;
    for (final bucket in bucketRepos) {
      final items = await bucket.repo.getNotUploaded() as List<dynamic>;

      for (final item in items) {
        try {
          final file = File("$filePath/${item.fileName}");

          await remoteStore.uploadFile(
            bucket: bucket.bucket,
            fileName: item.fileName,
            file: file,
            contentType: bucket.contentType,
          );
          await bucket.repo.delete(item.fileName);
          uploaded++;
        } catch (e, s) {
          logger.e("Error while uploading file");
          if (e is! ClientException) {
            await Sentry.captureException(e, stackTrace: s);
          }
        }
      }
    }
    return uploaded;
  }
}
