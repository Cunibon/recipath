import 'dart:io';
import 'dart:typed_data';

abstract class RemoteStore {
  Future<void> upsert(String table, List<Map<String, dynamic>> rows);
  Future<List<Map<String, dynamic>>> fetchUpdatedSince(
    String table,
    DateTime since, {
    bool excludeDeleted = false,
  });

  Future<void> uploadFile({
    required String bucket,
    required String fileName,
    required File file,
    required String contentType,
  });
  Future<Uint8List> downloadFile({
    required String bucket,
    required String fileName,
  });
}
