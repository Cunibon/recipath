// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingNotUploadedNotifier)
final shoppingNotUploadedProvider = ShoppingNotUploadedNotifierProvider._();

final class ShoppingNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  ShoppingNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return shoppingNotUploadedNotifier(ref);
  }
}

String _$shoppingNotUploadedNotifierHash() =>
    r'26a3ef8321069956b8d5cf5d0603fe0ace013231';
