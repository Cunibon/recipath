import 'package:drift/drift.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/backend/remote_store/remote_store.dart';
import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/sanitize_data_class.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/repos/abstract/repo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class DataSyncRepo {
  DataSyncRepo({required this.repo, required this.remoteStore});
  final Repo repo;

  final RemoteStore remoteStore;

  String get supabaseTableName;
  TableInfo get driftTable;

  Insertable fromJson(Map<String, dynamic> json);

  Future<int> upload() async {
    final toUploadData = await repo.getNotUploaded();
    final uploadJson = toUploadData
        .map((e) => e.sanitizedJson()..remove(uploadedKey))
        .toList();

    try {
      if (toUploadData.isNotEmpty) {
        await remoteStore.upsert(supabaseTableName, uploadJson);
      }
    } catch (e) {
      await Sentry.addBreadcrumb(
        Breadcrumb(
          message: "Error uploading $supabaseTableName",
          level: .error,
          data: {"length": toUploadData.length, "data": uploadJson},
        ),
      );
      rethrow;
    }

    return toUploadData.length;
  }

  Future<DownloadResult> download(DateTime lastSync) async {
    final supabaseData = await remoteStore.fetchUpdatedSince(
      supabaseTableName,
      lastSync,
    );

    for (final data in supabaseData) {
      await repo.db
          .into(driftTable)
          .insertOnConflictUpdate(fromJson(data..[uploadedKey] = true));
    }

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
