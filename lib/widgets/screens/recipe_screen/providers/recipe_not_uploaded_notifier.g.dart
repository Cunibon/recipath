// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeNotUploadedNotifier)
final recipeNotUploadedProvider = RecipeNotUploadedNotifierProvider._();

final class RecipeNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  RecipeNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return recipeNotUploadedNotifier(ref);
  }
}

String _$recipeNotUploadedNotifierHash() =>
    r'7c14f252c3f1dd597ccf120f623d024b5784f5cd';
