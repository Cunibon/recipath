import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestrator_notifier.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service/syncing_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service_notifier.g.dart';

@Riverpod(keepAlive: true)
SyncingService syncingServiceNotifier(Ref ref) {
  final service = SyncingService(
    orchestrator: ref.watch(syncOrchestratorNotifierProvider),
  );

  ref.onDispose(() => service.stop());

  return service;
}
