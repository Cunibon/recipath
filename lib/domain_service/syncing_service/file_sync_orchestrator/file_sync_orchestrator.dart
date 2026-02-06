import 'dart:io';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/bucket_repo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FileSyncOrchestrator {
  FileSyncOrchestrator({
    required this.supabaseClient,
    required this.bucketRepos,
    required this.filePath,
  });

  final SupabaseClient supabaseClient;

  final List<BucketRepo> bucketRepos;
  final String filePath;

  final logger = Logger();

  Future<int> uploadAll() async {
    int uploaded = 0;
    for (final bucket in bucketRepos) {
      final items = await bucket.repo.getNotUploaded() as List<dynamic>;

      for (final item in items) {
        try {
          final file = File("$filePath/${item.fileName}");

          await supabaseClient.storage
              .from(bucket.bucket)
              .upload(
                item.fileName,
                file,
                fileOptions: FileOptions(
                  upsert: true,
                  contentType: bucket.contentType,
                  metadata: {'owner_id': supabaseClient.auth.currentUser!.id},
                ),
              );
          await bucket.repo.delete(
            FileData(fileName: item.fileName, uploaded: true),
          );
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
