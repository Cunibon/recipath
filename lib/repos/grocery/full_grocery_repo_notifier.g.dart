// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_grocery_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullGroceryRepoNotifier)
final fullGroceryRepoProvider = FullGroceryRepoNotifierProvider._();

final class FullGroceryRepoNotifierProvider
    extends
        $FunctionalProvider<
          TagFilteredRepo<GroceryData>,
          TagFilteredRepo<GroceryData>,
          TagFilteredRepo<GroceryData>
        >
    with $Provider<TagFilteredRepo<GroceryData>> {
  FullGroceryRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullGroceryRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullGroceryRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<TagFilteredRepo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<GroceryData> create(Ref ref) {
    return fullGroceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<GroceryData>>(value),
    );
  }
}

String _$fullGroceryRepoNotifierHash() =>
    r'7fa80a8708cd442d2b54e61a6efa8ef5dad0ed07';
