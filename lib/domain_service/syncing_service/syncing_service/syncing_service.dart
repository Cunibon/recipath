import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_keys.dart';

class SyncingService {
  SyncingService({required this.orchestrator});
  final logger = Logger();

  final SyncOrchestrator orchestrator;

  Timer? _timer;
  Completer syncRunning = Completer();

  late DateTime _lastSync;
  DateTime get lastSync => _lastSync;

  Future<void> start() async {
    final savedSync = localStorage.getItem(SyncingKeys.storageKey);
    if (savedSync != null) {
      _lastSync = DateTime.parse(savedSync);
    } else {
      _lastSync = DateTime.fromMicrosecondsSinceEpoch(0);
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

    int? uploadedCount;
    DownloadResult? downloadedResult;

    try {
      uploadedCount = await orchestrator.uploadAll();
      downloadedResult = await orchestrator.downloadAll(lastSync);
    } catch (e, s) {
      logger.e("Sync failed", error: e, stackTrace: s);
    } finally {
      stopwatch.stop();
      logger.i(
        "Sync took: ${stopwatch.elapsed}\nUploaded: $uploadedCount | Downloaded: ${downloadedResult?.lastDate}",
      );

      final lastDate = downloadedResult?.lastDate;

      if (lastDate != null) {
        localStorage.setItem(
          SyncingKeys.storageKey,
          lastDate.toIso8601String(),
        );
        _lastSync = lastDate;
      }

      if (_timer != null) {
        _timer = Timer(Duration(minutes: 1), () => sync());
      }
      syncRunning.complete();
      syncRunning = Completer();
    }
  }
}
