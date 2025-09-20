// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_history_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeHistoryScreenNotifier)
const recipeHistoryScreenProvider = RecipeHistoryScreenNotifierProvider._();

final class RecipeHistoryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<HistoryData>>>,
          Map<DateTime, List<HistoryData>>,
          FutureOr<Map<DateTime, List<HistoryData>>>
        >
    with
        $FutureModifier<Map<DateTime, List<HistoryData>>>,
        $FutureProvider<Map<DateTime, List<HistoryData>>> {
  const RecipeHistoryScreenNotifierProvider._()
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
  $FutureProviderElement<Map<DateTime, List<HistoryData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<HistoryData>>> create(Ref ref) {
    return recipeHistoryScreenNotifier(ref);
  }
}

String _$recipeHistoryScreenNotifierHash() =>
    r'c98abec68895bdaac8a2adc194513df4b50e4f37';
