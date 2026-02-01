// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExportNotifier)
final exportProvider = ExportNotifierProvider._();

final class ExportNotifierProvider
    extends $NotifierProvider<ExportNotifier, List<String>?> {
  ExportNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exportNotifierHash();

  @$internal
  @override
  ExportNotifier create() => ExportNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>?>(value),
    );
  }
}

String _$exportNotifierHash() => r'fe19279413e656d760841fe56d962c81d598600c';

abstract class _$ExportNotifier extends $Notifier<List<String>?> {
  List<String>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>?, List<String>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>?, List<String>?>,
              List<String>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
