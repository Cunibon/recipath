// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_grocery_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullGroceryRepoNotifier)
const fullGroceryRepoProvider = FullGroceryRepoNotifierProvider._();

final class FullGroceryRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<GroceryData>,
          SyncRepo<GroceryData>,
          SyncRepo<GroceryData>
        >
    with $Provider<SyncRepo<GroceryData>> {
  const FullGroceryRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullGroceryRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullGroceryRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<GroceryData> create(Ref ref) {
    return fullGroceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<GroceryData>>(value),
    );
  }
}

String _$fullGroceryRepoNotifierHash() =>
    r'9fc13f9cea3b28a918472eba59f6ed53559580ff';
