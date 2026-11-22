import 'dart:io';
import 'dart:typed_data';

import 'package:recipath/domain_service/backend/remote_store/remote_store.dart';

class NoRemoteStore implements RemoteStore {
  @override
  Future<void> upsert(String table, List<Map<String, dynamic>> rows) =>
      throw UnsupportedError("No backend configured");

  @override
  Future<List<Map<String, dynamic>>> fetchUpdatedSince(
    String table,
    DateTime since, {
    bool excludeDeleted = false,
  }) => throw UnsupportedError("No backend configured");

  @override
  Future<void> uploadFile({
    required String bucket,
    required String fileName,
    required File file,
    required String contentType,
  }) => throw UnsupportedError("No backend configured");

  @override
  Future<Uint8List> downloadFile({
    required String bucket,
    required String fileName,
  }) => throw UnsupportedError("No backend configured");
}
