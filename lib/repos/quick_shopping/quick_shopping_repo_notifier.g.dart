// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quickShoppingRepoNotifier)
final quickShoppingRepoProvider = QuickShoppingRepoNotifierProvider._();

final class QuickShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<QuickShoppingData>,
          LocalRepo<QuickShoppingData>,
          LocalRepo<QuickShoppingData>
        >
    with $Provider<LocalRepo<QuickShoppingData>> {
  QuickShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickShoppingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<QuickShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<QuickShoppingData> create(Ref ref) {
    return quickShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<QuickShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<QuickShoppingData>>(value),
    );
  }
}

String _$quickShoppingRepoNotifierHash() =>
    r'df8ff421b128c9c9edf2dd1244628bc0780e0e25';
