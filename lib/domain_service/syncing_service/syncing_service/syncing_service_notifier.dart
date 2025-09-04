import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/file_sync_orchestrator_notifier.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestrator_notifier.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<SyncingService> syncingServiceNotifier(Ref ref) async {
  final service = SyncingService(
    syncOrchestrator: await ref.watch(syncOrchestratorNotifierProvider.future),
    fileSyncOrchestrator: ref.watch(fileSyncOrchestratorNotifierProvider),
  );

  ref.onDispose(() => service.stop());
  service.start();

  return service;
}
