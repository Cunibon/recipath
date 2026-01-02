// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeChartNotifier)
final recipeChartProvider = RecipeChartNotifierFamily._();

final class RecipeChartNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChartState>,
          ChartState,
          FutureOr<ChartState>
        >
    with $FutureModifier<ChartState>, $FutureProvider<ChartState> {
  RecipeChartNotifierProvider._({
    required RecipeChartNotifierFamily super.from,
    required (DateTimeRange<DateTime>, Set<String>) super.argument,
  }) : super(
         retry: null,
         name: r'recipeChartProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeChartNotifierHash();

  @override
  String toString() {
    return r'recipeChartProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ChartState> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ChartState> create(Ref ref) {
    final argument = this.argument as (DateTimeRange<DateTime>, Set<String>);
    return recipeChartNotifier(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeChartNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeChartNotifierHash() =>
    r'bbf2fdebb496665b1c45f37307f61811d8cfb7b3';

final class RecipeChartNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ChartState>,
          (DateTimeRange<DateTime>, Set<String>)
        > {
  RecipeChartNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeChartProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    Set<String> selectedRecipes,
  ) => RecipeChartNotifierProvider._(
    argument: (dateRange, selectedRecipes),
    from: this,
  );

  @override
  String toString() => r'recipeChartProvider';
}
