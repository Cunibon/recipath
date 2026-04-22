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
          TagFilteredRepo<GroceryData>,
          TagFilteredRepo<GroceryData>,
          TagFilteredRepo<GroceryData>
        >
    with $Provider<TagFilteredRepo<GroceryData>> {
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
  $ProviderElement<TagFilteredRepo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<GroceryData> create(Ref ref) {
    return groceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<GroceryData>>(value),
    );
  }
}

String _$groceryRepoNotifierHash() =>
    r'e653bf98a19a4cea9ea6ee46c1d26341cdfdc4a9';
