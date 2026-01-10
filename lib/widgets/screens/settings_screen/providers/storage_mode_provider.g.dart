// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StorageModeNotifier)
final storageModeProvider = StorageModeNotifierProvider._();

final class StorageModeNotifierProvider
    extends $NotifierProvider<StorageModeNotifier, bool> {
  StorageModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageModeNotifierHash();

  @$internal
  @override
  StorageModeNotifier create() => StorageModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$storageModeNotifierHash() =>
    r'06a2f019a7f7359f40997944ee838ebefa509076';

abstract class _$StorageModeNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
