import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/file_sync_orchestrator_notifier.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestrator_notifier.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service_notifier.g.dart';

@Riverpod(keepAlive: true)
SyncingService syncingServiceNotifier(Ref ref) {
  final service = SyncingService(
    getSyncOrchestrator: () async =>
        await ref.read(syncOrchestratorProvider.future),
    getFileSyncOrchestrator: () async =>
        await ref.read(fileSyncOrchestratorProvider.future),
  );

  ref.onDispose(() => service.stop());
  service.start();

  return service;
}
