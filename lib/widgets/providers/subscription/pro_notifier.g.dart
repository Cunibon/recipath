// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProNotifier)
final proProvider = ProNotifierProvider._();

final class ProNotifierProvider
    extends $AsyncNotifierProvider<ProNotifier, bool> {
  ProNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proNotifierHash();

  @$internal
  @override
  ProNotifier create() => ProNotifier();
}

String _$proNotifierHash() => r'7454d26c8ac55e9cdb7a4233dc9006d9db43e187';

abstract class _$ProNotifier extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
