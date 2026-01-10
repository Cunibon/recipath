// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_item_history_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeItemHistoryScreenNotifier)
final recipeItemHistoryScreenProvider =
    RecipeItemHistoryScreenNotifierFamily._();

final class RecipeItemHistoryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<HistoryData>>>,
          Map<DateTime, List<HistoryData>>,
          FutureOr<Map<DateTime, List<HistoryData>>>
        >
    with
        $FutureModifier<Map<DateTime, List<HistoryData>>>,
        $FutureProvider<Map<DateTime, List<HistoryData>>> {
  RecipeItemHistoryScreenNotifierProvider._({
    required RecipeItemHistoryScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeItemHistoryScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeItemHistoryScreenNotifierHash();

  @override
  String toString() {
    return r'recipeItemHistoryScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<HistoryData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<HistoryData>>> create(Ref ref) {
    final argument = this.argument as String;
    return recipeItemHistoryScreenNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeItemHistoryScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeItemHistoryScreenNotifierHash() =>
    r'0bec4d86292c975d3ec0b12f6e820258bf180fc6';

final class RecipeItemHistoryScreenNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<DateTime, List<HistoryData>>>,
          String
        > {
  RecipeItemHistoryScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeItemHistoryScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeItemHistoryScreenNotifierProvider call(String id) =>
      RecipeItemHistoryScreenNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'recipeItemHistoryScreenProvider';
}
