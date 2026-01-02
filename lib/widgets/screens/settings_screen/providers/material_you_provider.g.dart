// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_you_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MaterialYouNotifier)
final materialYouProvider = MaterialYouNotifierProvider._();

final class MaterialYouNotifierProvider
    extends $NotifierProvider<MaterialYouNotifier, bool> {
  MaterialYouNotifierProvider._()
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
    r'8e388c815563c359c83db200abb4791a0ddf3d61';

abstract class _$MaterialYouNotifier extends $Notifier<bool> {
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
