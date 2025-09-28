// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagFilterNotifier)
const tagFilterProvider = TagFilterNotifierFamily._();

final class TagFilterNotifierProvider
    extends $NotifierProvider<TagFilterNotifier, List<TagData>> {
  const TagFilterNotifierProvider._({
    required TagFilterNotifierFamily super.from,
    required FilterTypes super.argument,
  }) : super(
         retry: null,
         name: r'tagFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tagFilterNotifierHash();

  @override
  String toString() {
    return r'tagFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TagFilterNotifier create() => TagFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TagData>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TagFilterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagFilterNotifierHash() => r'31b75911940a54b1d8b552db54fde48ba22c13b8';

final class TagFilterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TagFilterNotifier,
          List<TagData>,
          List<TagData>,
          List<TagData>,
          FilterTypes
        > {
  const TagFilterNotifierFamily._()
    : super(
        retry: null,
        name: r'tagFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagFilterNotifierProvider call(FilterTypes filterType) =>
      TagFilterNotifierProvider._(argument: filterType, from: this);

  @override
  String toString() => r'tagFilterProvider';
}

abstract class _$TagFilterNotifier extends $Notifier<List<TagData>> {
  late final _$args = ref.$arg as FilterTypes;
  FilterTypes get filterType => _$args;

  List<TagData> build(FilterTypes filterType);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<List<TagData>, List<TagData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TagData>, List<TagData>>,
              List<TagData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
