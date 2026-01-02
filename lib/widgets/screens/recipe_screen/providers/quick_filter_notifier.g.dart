// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_filter_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

const _$QuickFiltersEnumMap = {QuickFilters.running: 'running'};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuickFilterNotifier)
final quickFilterProvider = QuickFilterNotifierProvider._();

final class QuickFilterNotifierProvider
    extends $NotifierProvider<QuickFilterNotifier, Map<QuickFilters, bool>> {
  QuickFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickFilterNotifierHash();

  @$internal
  @override
  QuickFilterNotifier create() => QuickFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<QuickFilters, bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<QuickFilters, bool>>(value),
    );
  }
}

String _$quickFilterNotifierHash() =>
    r'0d07ae5f694b44af0f179637e395f6b467f82c8a';

abstract class _$QuickFilterNotifier
    extends $Notifier<Map<QuickFilters, bool>> {
  Map<QuickFilters, bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<QuickFilters, bool>, Map<QuickFilters, bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<QuickFilters, bool>, Map<QuickFilters, bool>>,
              Map<QuickFilters, bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
