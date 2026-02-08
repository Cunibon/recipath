import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/file_sync_orchestrator.dart';
import 'package:recipath/domain_service/syncing_service/repos/full_download_result.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/helper/local_storage_extension.dart';

class SyncingService {
  SyncingService({
    required this.getSyncOrchestrator,
    required this.getFileSyncOrchestrator,
  });
  final Future<SyncOrchestrator> Function() getSyncOrchestrator;
  final Future<FileSyncOrchestrator> Function() getFileSyncOrchestrator;

  final logger = Logger();

  Timer? _timer;
  Completer nextSync = Completer();

  bool syncRunning = false;

  late Map<String, DateTime> _tableSyncs;

  Future<void> start() async {
    final savedSyncs = localStorage.get<Map<String, dynamic>>(
      SyncingKeys.storageKey,
    );
    if (savedSyncs != null) {
      _tableSyncs = savedSyncs.map(
        (key, value) => MapEntry(key, DateTime.parse(value)),
      );
    } else {
      _tableSyncs = {};
    }

    _timer = Timer(Duration(minutes: 1), () => sync());

    await sync();
  }

  Future<void> stop() async {
    final previousTimer = _timer;
    _timer = null;

    if (previousTimer?.isActive == true) {
      previousTimer?.cancel();
    } else {
      await nextSync.future;
    }
  }

  Future<void> reset() async {
    await stop();
    localStorage.removeItem(SyncingKeys.storageKey);
    await start();
  }

  Future<void> sync() async {
    if (syncRunning) return;
    syncRunning = true;

    _timer?.cancel();
    final stopwatch = Stopwatch()..start();

    int? fileUpload;
    int? uploadedCount;
    FullDownloadResult? downloadResult;

    try {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.first != ConnectivityResult.none) {
        final fileSyncOrchestrator = await getFileSyncOrchestrator();
        final syncOrchestrator = await getSyncOrchestrator();

        fileUpload = await fileSyncOrchestrator.uploadAll();
        uploadedCount = await syncOrchestrator.uploadAll();
        downloadResult = await syncOrchestrator.downloadAll(_tableSyncs);
      }
    } catch (e, s) {
      logger.e("Sync failed", error: e, stackTrace: s);
    } finally {
      stopwatch.stop();
      logger.i(
        "Sync took: ${stopwatch.elapsed}\nUploaded: $uploadedCount objects, $fileUpload files | Downloaded: ${downloadResult?.count}",
      );

      if (downloadResult?.tableSyncs != null) {
        localStorage.set(
          SyncingKeys.storageKey,
          downloadResult!.tableSyncs.map(
            (key, value) => MapEntry(key, value.toIso8601String()),
          ),
        );
        _tableSyncs = downloadResult.tableSyncs;
      }

      if (_timer != null) {
        _timer = Timer(Duration(minutes: 1), () => sync());
      }
      syncRunning = false;
      nextSync.complete();
      nextSync = Completer();
    }
  }
}
