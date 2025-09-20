// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageModifierNotifier)
const storageModifierProvider = StorageModifierNotifierProvider._();

final class StorageModifierNotifierProvider
    extends
        $FunctionalProvider<StorageModifier, StorageModifier, StorageModifier>
    with $Provider<StorageModifier> {
  const StorageModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<StorageModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageModifier create(Ref ref) {
    return storageModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageModifier>(value),
    );
  }
}

String _$storageModifierNotifierHash() =>
    r'cc3442721f66cd614d4e196a13c2215418adabae';
