// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeShoppingScreenNotifier)
final recipeShoppingScreenProvider = RecipeShoppingScreenNotifierProvider._();

final class RecipeShoppingScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<HistoryScreenData>,
          HistoryScreenData,
          FutureOr<HistoryScreenData>
        >
    with
        $FutureModifier<HistoryScreenData>,
        $FutureProvider<HistoryScreenData> {
  RecipeShoppingScreenNotifierProvider._()
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
  $FutureProviderElement<HistoryScreenData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HistoryScreenData> create(Ref ref) {
    return recipeShoppingScreenNotifier(ref);
  }
}

String _$recipeShoppingScreenNotifierHash() =>
    r'7fb270a4b7df1c2d101986708180419bd8f2868c';
