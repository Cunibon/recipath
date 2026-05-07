// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_history_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeHistoryScreenNotifier)
final recipeHistoryScreenProvider = RecipeHistoryScreenNotifierProvider._();

final class RecipeHistoryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<HistoryScreenData>,
          HistoryScreenData,
          FutureOr<HistoryScreenData>
        >
    with
        $FutureModifier<HistoryScreenData>,
        $FutureProvider<HistoryScreenData> {
  RecipeHistoryScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeHistoryScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeHistoryScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<HistoryScreenData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HistoryScreenData> create(Ref ref) {
    return recipeHistoryScreenNotifier(ref);
  }
}

String _$recipeHistoryScreenNotifierHash() =>
    r'f2f127a18d908e5928fc58152f12bb4d1556f1d3';
