// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_orchestrator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncOrchestratorNotifier)
const syncOrchestratorProvider = SyncOrchestratorNotifierProvider._();

final class SyncOrchestratorNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<SyncOrchestrator>,
          SyncOrchestrator,
          FutureOr<SyncOrchestrator>
        >
    with $FutureModifier<SyncOrchestrator>, $FutureProvider<SyncOrchestrator> {
  const SyncOrchestratorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncOrchestratorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncOrchestratorNotifierHash();

  @$internal
  @override
  $FutureProviderElement<SyncOrchestrator> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SyncOrchestrator> create(Ref ref) {
    return syncOrchestratorNotifier(ref);
  }
}

String _$syncOrchestratorNotifierHash() =>
    r'5f544842abc29979d2308309f6f5a5c2f8bd5731';
