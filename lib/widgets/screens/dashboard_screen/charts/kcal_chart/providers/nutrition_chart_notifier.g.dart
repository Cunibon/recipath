// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nutritionChartNotifier)
const nutritionChartProvider = NutritionChartNotifierFamily._();

final class NutritionChartNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChartState>,
          ChartState,
          FutureOr<ChartState>
        >
    with $FutureModifier<ChartState>, $FutureProvider<ChartState> {
  const NutritionChartNotifierProvider._({
    required NutritionChartNotifierFamily super.from,
    required (DateTimeRange<DateTime>, Set<String>) super.argument,
  }) : super(
         retry: null,
         name: r'nutritionChartProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nutritionChartNotifierHash();

  @override
  String toString() {
    return r'nutritionChartProvider'
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
    return nutritionChartNotifier(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is NutritionChartNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nutritionChartNotifierHash() =>
    r'3ffd6ea74a71b77920dd98349eec29798a4ba90e';

final class NutritionChartNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ChartState>,
          (DateTimeRange<DateTime>, Set<String>)
        > {
  const NutritionChartNotifierFamily._()
    : super(
        retry: null,
        name: r'nutritionChartProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NutritionChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    Set<String> selectedRecipes,
  ) => NutritionChartNotifierProvider._(
    argument: (dateRange, selectedRecipes),
    from: this,
  );

  @override
  String toString() => r'nutritionChartProvider';
}
