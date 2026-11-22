import 'dart:io';
import 'dart:typed_data';

import 'package:recipath/domain_service/backend/remote_store/remote_store.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRemoteStore implements RemoteStore {
  SupabaseRemoteStore(this._client);

  final SupabaseClient _client;

  @override
  Future<void> upsert(String table, List<Map<String, dynamic>> rows) =>
      _client.from(table).upsert(rows);

  @override
  Future<List<Map<String, dynamic>>> fetchUpdatedSince(
    String table,
    DateTime since, {
    bool excludeDeleted = false,
  }) {
    var query = _client
        .from(table)
        .select()
        .gt(SyncingKeys.updatedAtKey, since.toIso8601String());

    if (excludeDeleted) {
      query = query.eq(SyncingKeys.deleted, false);
    }

    return query.order(SyncingKeys.updatedAtKey, ascending: true);
  }

  @override
  Future<void> uploadFile({
    required String bucket,
    required String fileName,
    required File file,
    required String contentType,
  }) => _client.storage
      .from(bucket)
      .upload(
        fileName,
        file,
        fileOptions: FileOptions(
          upsert: true,
          contentType: contentType,
          metadata: {'owner_id': _client.auth.currentUser!.id},
        ),
      );

  @override
  Future<Uint8List> downloadFile({
    required String bucket,
    required String fileName,
  }) => _client.storage.from(bucket).download(fileName);
}
