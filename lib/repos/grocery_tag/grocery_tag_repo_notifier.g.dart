// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryTagRepoNotifier)
final groceryTagRepoProvider = GroceryTagRepoNotifierProvider._();

final class GroceryTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<GroceryTagData>,
          LocalRepo<GroceryTagData>,
          LocalRepo<GroceryTagData>
        >
    with $Provider<LocalRepo<GroceryTagData>> {
  GroceryTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryTagRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<GroceryTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<GroceryTagData> create(Ref ref) {
    return groceryTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<GroceryTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<GroceryTagData>>(value),
    );
  }
}

String _$groceryTagRepoNotifierHash() =>
    r'44d55fb0b8ec7dc628aefce4917fd8a2f2f501d7';
