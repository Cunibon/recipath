// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_sync_orchestrator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileSyncOrchestratorNotifier)
const fileSyncOrchestratorProvider = FileSyncOrchestratorNotifierProvider._();

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
  const FileSyncOrchestratorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileSyncOrchestratorProvider',
        isAutoDispose: true,
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
    r'6cec82c1e9f1f55f6f67492f7454bbf3e11f530b';
