// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_quick_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullQuickShoppingRepoNotifier)
final fullQuickShoppingRepoProvider = FullQuickShoppingRepoNotifierProvider._();

final class FullQuickShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<QuickShoppingData>,
          LocalRepo<QuickShoppingData>,
          LocalRepo<QuickShoppingData>
        >
    with $Provider<LocalRepo<QuickShoppingData>> {
  FullQuickShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullQuickShoppingRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullQuickShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<QuickShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<QuickShoppingData> create(Ref ref) {
    return fullQuickShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<QuickShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<QuickShoppingData>>(value),
    );
  }
}

String _$fullQuickShoppingRepoNotifierHash() =>
    r'366685be32bd8abf9eea5f80d111f107aa5c15de';
