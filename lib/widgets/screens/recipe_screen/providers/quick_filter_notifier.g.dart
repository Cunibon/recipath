// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_filter_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

const _$QuickFiltersEnumMap = {
  QuickFilters.running: 'running',
  QuickFilters.cookable: 'cookable',
  QuickFilters.cluster: 'cluster',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuickFilterNotifier)
final quickFilterProvider = QuickFilterNotifierFamily._();

final class QuickFilterNotifierProvider
    extends $NotifierProvider<QuickFilterNotifier, Map<QuickFilters, bool>> {
  QuickFilterNotifierProvider._({
    required QuickFilterNotifierFamily super.from,
    required TagTypeEnum super.argument,
  }) : super(
         retry: null,
         name: r'quickFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$quickFilterNotifierHash();

  @override
  String toString() {
    return r'quickFilterProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is QuickFilterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quickFilterNotifierHash() =>
    r'cd57bd8cc242b2cf54a0962c2cfc0b298811bc5e';

final class QuickFilterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QuickFilterNotifier,
          Map<QuickFilters, bool>,
          Map<QuickFilters, bool>,
          Map<QuickFilters, bool>,
          TagTypeEnum
        > {
  QuickFilterNotifierFamily._()
    : super(
        retry: null,
        name: r'quickFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuickFilterNotifierProvider call(TagTypeEnum filterType) =>
      QuickFilterNotifierProvider._(argument: filterType, from: this);

  @override
  String toString() => r'quickFilterProvider';
}

abstract class _$QuickFilterNotifier
    extends $Notifier<Map<QuickFilters, bool>> {
  late final _$args = ref.$arg as TagTypeEnum;
  TagTypeEnum get filterType => _$args;

  Map<QuickFilters, bool> build(TagTypeEnum filterType);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
