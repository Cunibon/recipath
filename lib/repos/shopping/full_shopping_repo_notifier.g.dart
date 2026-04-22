// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullShoppingRepoNotifier)
final fullShoppingRepoProvider = FullShoppingRepoNotifierProvider._();

final class FullShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          TagFilteredRepo<ShoppingData>,
          TagFilteredRepo<ShoppingData>,
          TagFilteredRepo<ShoppingData>
        >
    with $Provider<TagFilteredRepo<ShoppingData>> {
  FullShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullShoppingRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<TagFilteredRepo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<ShoppingData> create(Ref ref) {
    return fullShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<ShoppingData>>(
        value,
      ),
    );
  }
}

String _$fullShoppingRepoNotifierHash() =>
    r'07231c94046b12c55312345a4cd9aab67b111769';
