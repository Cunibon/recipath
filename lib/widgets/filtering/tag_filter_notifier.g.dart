// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagFilterNotifier)
final tagFilterProvider = TagFilterNotifierFamily._();

final class TagFilterNotifierProvider
    extends $NotifierProvider<TagFilterNotifier, Set<String>> {
  TagFilterNotifierProvider._({
    required TagFilterNotifierFamily super.from,
    required TagTypeEnum super.argument,
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
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
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

String _$tagFilterNotifierHash() => r'1ea49ac741e21dc46c45c952e552a677f582a599';

final class TagFilterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TagFilterNotifier,
          Set<String>,
          Set<String>,
          Set<String>,
          TagTypeEnum
        > {
  TagFilterNotifierFamily._()
    : super(
        retry: null,
        name: r'tagFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagFilterNotifierProvider call(TagTypeEnum filterType) =>
      TagFilterNotifierProvider._(argument: filterType, from: this);

  @override
  String toString() => r'tagFilterProvider';
}

abstract class _$TagFilterNotifier extends $Notifier<Set<String>> {
  late final _$args = ref.$arg as TagTypeEnum;
  TagTypeEnum get filterType => _$args;

  Set<String> build(TagTypeEnum filterType);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
