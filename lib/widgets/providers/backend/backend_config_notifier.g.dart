// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_config_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BackendConfigNotifier)
final backendConfigProvider = BackendConfigNotifierProvider._();

final class BackendConfigNotifierProvider
    extends $AsyncNotifierProvider<BackendConfigNotifier, BackendConfigData?> {
  BackendConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backendConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backendConfigNotifierHash();

  @$internal
  @override
  BackendConfigNotifier create() => BackendConfigNotifier();
}

String _$backendConfigNotifierHash() =>
    r'e7375fa5903adeab0dad3361f305cc45b83888f2';

abstract class _$BackendConfigNotifier
    extends $AsyncNotifier<BackendConfigData?> {
  FutureOr<BackendConfigData?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<BackendConfigData?>, BackendConfigData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BackendConfigData?>, BackendConfigData?>,
              AsyncValue<BackendConfigData?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
