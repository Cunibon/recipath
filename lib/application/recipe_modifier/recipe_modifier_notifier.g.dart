// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeModifierNotifier)
const recipeModifierProvider = RecipeModifierNotifierProvider._();

final class RecipeModifierNotifierProvider
    extends $FunctionalProvider<RecipeModifier, RecipeModifier, RecipeModifier>
    with $Provider<RecipeModifier> {
  const RecipeModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecipeModifier create(Ref ref) {
    return recipeModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeModifier>(value),
    );
  }
}

String _$recipeModifierNotifierHash() =>
    r'6c641df19b1212fa0b488e3cb89b326dd42a989f';
