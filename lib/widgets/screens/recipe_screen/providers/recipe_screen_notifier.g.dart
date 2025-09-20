// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeScreenNotifier)
const recipeScreenProvider = RecipeScreenNotifierProvider._();

final class RecipeScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<RecipeScreenState>,
          RecipeScreenState,
          FutureOr<RecipeScreenState>
        >
    with
        $FutureModifier<RecipeScreenState>,
        $FutureProvider<RecipeScreenState> {
  const RecipeScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<RecipeScreenState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RecipeScreenState> create(Ref ref) {
    return recipeScreenNotifier(ref);
  }
}

String _$recipeScreenNotifierHash() =>
    r'3e325a10f131f1e0ce2099478b922cc1c860c9a7';
