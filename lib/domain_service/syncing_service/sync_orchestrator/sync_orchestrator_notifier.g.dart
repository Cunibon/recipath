// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_orchestrator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncOrchestratorNotifier)
final syncOrchestratorProvider = SyncOrchestratorNotifierProvider._();

final class SyncOrchestratorNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<SyncOrchestrator>,
          SyncOrchestrator,
          FutureOr<SyncOrchestrator>
        >
    with $FutureModifier<SyncOrchestrator>, $FutureProvider<SyncOrchestrator> {
  SyncOrchestratorNotifierProvider._()
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
    r'0edfc0e212e91cdc4ed7c4b8c401414943c6b0af';
