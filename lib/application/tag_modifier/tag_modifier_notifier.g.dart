// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagModifierNotifier)
final tagModifierProvider = TagModifierNotifierProvider._();

final class TagModifierNotifierProvider
    extends $FunctionalProvider<TagModifier, TagModifier, TagModifier>
    with $Provider<TagModifier> {
  TagModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<TagModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TagModifier create(Ref ref) {
    return tagModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagModifier>(value),
    );
  }
}

String _$tagModifierNotifierHash() =>
    r'8e3d783dbd20b9d050f9dacffb20ade51f2efff0';
