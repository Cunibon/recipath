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
          LocalRepo<ShoppingData>,
          LocalRepo<ShoppingData>,
          LocalRepo<ShoppingData>
        >
    with $Provider<LocalRepo<ShoppingData>> {
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
  $ProviderElement<LocalRepo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<ShoppingData> create(Ref ref) {
    return shoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<ShoppingData>>(value),
    );
  }
}

String _$shoppingRepoNotifierHash() =>
    r'946f158806db187e13477863019cceb6588ee407';
