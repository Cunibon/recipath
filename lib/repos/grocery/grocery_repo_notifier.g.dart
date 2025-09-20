// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryRepoNotifier)
const groceryRepoProvider = GroceryRepoNotifierProvider._();

final class GroceryRepoNotifierProvider
    extends
        $FunctionalProvider<
          Repo<GroceryData>,
          Repo<GroceryData>,
          Repo<GroceryData>
        >
    with $Provider<Repo<GroceryData>> {
  const GroceryRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Repo<GroceryData> create(Ref ref) {
    return groceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<GroceryData>>(value),
    );
  }
}

String _$groceryRepoNotifierHash() =>
    r'6802b3964e279bcdb10833f1d74869f03d94aa82';
