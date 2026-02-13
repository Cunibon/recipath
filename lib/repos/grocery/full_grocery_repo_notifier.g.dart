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
          LocalRepo<GroceryData>,
          LocalRepo<GroceryData>,
          LocalRepo<GroceryData>
        >
    with $Provider<LocalRepo<GroceryData>> {
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
  $ProviderElement<LocalRepo<GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<GroceryData> create(Ref ref) {
    return fullGroceryRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<GroceryData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<GroceryData>>(value),
    );
  }
}

String _$fullGroceryRepoNotifierHash() =>
    r'24789c1ce82cb17174513a322f6621d682e07358';
