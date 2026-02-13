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
          LocalRepo<ShoppingData>,
          LocalRepo<ShoppingData>,
          LocalRepo<ShoppingData>
        >
    with $Provider<LocalRepo<ShoppingData>> {
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
  $ProviderElement<LocalRepo<ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<ShoppingData> create(Ref ref) {
    return fullShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<ShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<ShoppingData>>(value),
    );
  }
}

String _$fullShoppingRepoNotifierHash() =>
    r'c57a369a4e7c24053007a43359cf719a60983cb3';
