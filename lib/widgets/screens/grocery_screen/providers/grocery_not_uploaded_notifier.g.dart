// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryNotUploadedNotifier)
final groceryNotUploadedProvider = GroceryNotUploadedNotifierProvider._();

final class GroceryNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  GroceryNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return groceryNotUploadedNotifier(ref);
  }
}

String _$groceryNotUploadedNotifierHash() =>
    r'3e528e4b1252ea603428007f91dc1ca2d5ca4a5b';
