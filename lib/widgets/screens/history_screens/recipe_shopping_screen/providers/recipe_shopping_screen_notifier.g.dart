// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeShoppingScreenNotifier)
const recipeShoppingScreenProvider = RecipeShoppingScreenNotifierProvider._();

final class RecipeShoppingScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<HistoryData>>>,
          Map<DateTime, List<HistoryData>>,
          FutureOr<Map<DateTime, List<HistoryData>>>
        >
    with
        $FutureModifier<Map<DateTime, List<HistoryData>>>,
        $FutureProvider<Map<DateTime, List<HistoryData>>> {
  const RecipeShoppingScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeShoppingScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeShoppingScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<HistoryData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<HistoryData>>> create(Ref ref) {
    return recipeShoppingScreenNotifier(ref);
  }
}

String _$recipeShoppingScreenNotifierHash() =>
    r'79243dd4db4485a55c4e24869854d127702b1cf5';
