// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_grocery_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullGroceryTagRepoNotifier)
final fullGroceryTagRepoProvider = FullGroceryTagRepoNotifierProvider._();

final class FullGroceryTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<GroceryTagData>,
          LocalRepo<GroceryTagData>,
          LocalRepo<GroceryTagData>
        >
    with $Provider<LocalRepo<GroceryTagData>> {
  FullGroceryTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullGroceryTagRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullGroceryTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<GroceryTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<GroceryTagData> create(Ref ref) {
    return fullGroceryTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<GroceryTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<GroceryTagData>>(value),
    );
  }
}

String _$fullGroceryTagRepoNotifierHash() =>
    r'3c03227180b6cc448f1aab21f8d75f06daa63c06';
