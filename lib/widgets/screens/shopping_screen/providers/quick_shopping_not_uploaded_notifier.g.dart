// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_shopping_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quickShoppingNotUploadedNotifier)
final quickShoppingNotUploadedProvider =
    QuickShoppingNotUploadedNotifierProvider._();

final class QuickShoppingNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  QuickShoppingNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickShoppingNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickShoppingNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return quickShoppingNotUploadedNotifier(ref);
  }
}

String _$quickShoppingNotUploadedNotifierHash() =>
    r'db87027d1401cab4d03bdaed561570a79f2e2c22';
