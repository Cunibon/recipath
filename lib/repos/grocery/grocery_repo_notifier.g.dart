// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryRepoNotifier)
final groceryRepoProvider = GroceryRepoNotifierProvider._();

final class GroceryRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<GroceryData>,
          LocalRepo<GroceryData>,
          LocalRepo<GroceryData>
        >
    with $Provider<LocalRepo<GroceryData>> {
  GroceryRepoNotifierProvider._()
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
  $ProviderElement<LocalRepo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<GroceryData> create(Ref ref) {
    return groceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<GroceryData>>(value),
    );
  }
}

String _$groceryRepoNotifierHash() =>
    r'549dccbd4442ea9263dbfdd2e06ecb587f641382';
