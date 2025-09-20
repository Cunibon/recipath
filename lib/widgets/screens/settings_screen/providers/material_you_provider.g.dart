// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_you_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MaterialYouNotifier)
const materialYouProvider = MaterialYouNotifierProvider._();

final class MaterialYouNotifierProvider
    extends $NotifierProvider<MaterialYouNotifier, bool> {
  const MaterialYouNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialYouProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialYouNotifierHash();

  @$internal
  @override
  MaterialYouNotifier create() => MaterialYouNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$materialYouNotifierHash() =>
    r'46de0c133a54a55df6d0dd764677cc722308a821';

abstract class _$MaterialYouNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
