import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/file_sync_orchestrator.dart';
import 'package:recipath/domain_service/syncing_service/repos/full_download_result.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/helper/local_storage_extension.dart';

class SyncingService {
  SyncingService({
    required this.syncOrchestrator,
    required this.fileSyncOrchestrator,
  });
  final SyncOrchestrator syncOrchestrator;
  final FileSyncOrchestrator fileSyncOrchestrator;

  final logger = Logger();

  Timer? _timer;
  Completer syncRunning = Completer();

  late Map<String, DateTime> _lastSyncs;

  Future<void> start() async {
    final savedSync = localStorage.get<Map<String, dynamic>>(
      SyncingKeys.storageKey,
    );
    if (savedSync != null) {
      _lastSyncs = savedSync.map(
        (key, value) => MapEntry(key, DateTime.parse(value)),
      );
    } else {
      _lastSyncs = {};
    }

    _timer = Timer(Duration(minutes: 1), () => sync());

    await sync();
  }

  Future<void> stop() async {
    final previousTimer = _timer;
    _timer = null;

    if (previousTimer?.isActive == true) {
      _timer?.cancel();
    } else {
      await syncRunning.future;
    }
  }

  Future<void> reset() async {
    await stop();
    localStorage.removeItem(SyncingKeys.storageKey);
    await start();
  }

  Future<void> sync() async {
    _timer?.cancel();
    final stopwatch = Stopwatch()..start();

    int? fileUpload;
    int? uploadedCount;
    FullDownloadResult? downloadResult;

    try {
      fileUpload = await fileSyncOrchestrator.uploadAll();
      uploadedCount = await syncOrchestrator.uploadAll();
      downloadResult = await syncOrchestrator.downloadAll(_lastSyncs);
    } catch (e, s) {
      logger.e("Sync failed", error: e, stackTrace: s);
    } finally {
      stopwatch.stop();
      logger.i(
        "Sync took: ${stopwatch.elapsed}\nUploaded: $uploadedCount objects, $fileUpload files | Downloaded: ${downloadResult?.count}",
      );

      if (downloadResult?.lastSyncs != null) {
        localStorage.set(
          SyncingKeys.storageKey,
          downloadResult!.lastSyncs.map(
            (key, value) => MapEntry(key, value.toIso8601String()),
          ),
        );
        _lastSyncs = downloadResult.lastSyncs;
      }

      if (_timer != null) {
        _timer = Timer(Duration(minutes: 1), () => sync());
      }
      syncRunning.complete();
      syncRunning = Completer();
    }
  }
}
