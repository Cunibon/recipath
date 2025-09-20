// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingRepoNotifier)
const shoppingRepoProvider = ShoppingRepoNotifierProvider._();

final class ShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          Repo<ShoppingData>,
          Repo<ShoppingData>,
          Repo<ShoppingData>
        >
    with $Provider<Repo<ShoppingData>> {
  const ShoppingRepoNotifierProvider._()
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
  $ProviderElement<Repo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Repo<ShoppingData> create(Ref ref) {
    return shoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<ShoppingData>>(value),
    );
  }
}

String _$shoppingRepoNotifierHash() =>
    r'c48e2ce372dacce1d1263f3b891fb2545f57f715';
