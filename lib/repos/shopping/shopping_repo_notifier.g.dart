// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingRepoNotifier)
final shoppingRepoProvider = ShoppingRepoNotifierProvider._();

final class ShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          TagFilteredRepo<ShoppingData>,
          TagFilteredRepo<ShoppingData>,
          TagFilteredRepo<ShoppingData>
        >
    with $Provider<TagFilteredRepo<ShoppingData>> {
  ShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<TagFilteredRepo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<ShoppingData> create(Ref ref) {
    return shoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<ShoppingData>>(
        value,
      ),
    );
  }
}

String _$shoppingRepoNotifierHash() =>
    r'a2cba87352b5f4f6d1da4b7ae952eabb41b67fd3';
