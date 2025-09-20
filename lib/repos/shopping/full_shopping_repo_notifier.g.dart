// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullShoppingRepoNotifier)
const fullShoppingRepoProvider = FullShoppingRepoNotifierProvider._();

final class FullShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<ShoppingData>,
          SyncRepo<ShoppingData>,
          SyncRepo<ShoppingData>
        >
    with $Provider<SyncRepo<ShoppingData>> {
  const FullShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullShoppingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<ShoppingData> create(Ref ref) {
    return fullShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<ShoppingData>>(value),
    );
  }
}

String _$fullShoppingRepoNotifierHash() =>
    r'2bb7c098209e4175784e64d6f19eafd91cc07c72';
