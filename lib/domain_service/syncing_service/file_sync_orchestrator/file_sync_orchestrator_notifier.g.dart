// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_sync_orchestrator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileSyncOrchestratorNotifier)
final fileSyncOrchestratorProvider = FileSyncOrchestratorNotifierProvider._();

final class FileSyncOrchestratorNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<FileSyncOrchestrator>,
          FileSyncOrchestrator,
          FutureOr<FileSyncOrchestrator>
        >
    with
        $FutureModifier<FileSyncOrchestrator>,
        $FutureProvider<FileSyncOrchestrator> {
  FileSyncOrchestratorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileSyncOrchestratorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileSyncOrchestratorNotifierHash();

  @$internal
  @override
  $FutureProviderElement<FileSyncOrchestrator> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FileSyncOrchestrator> create(Ref ref) {
    return fileSyncOrchestratorNotifier(ref);
  }
}

String _$fileSyncOrchestratorNotifierHash() =>
    r'923fd496c15853427b4d89d1d07a17dde5317ecd';
