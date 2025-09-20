// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeChartStatisticsNotifier)
const recipeChartStatisticsProvider = RecipeChartStatisticsNotifierFamily._();

final class RecipeChartStatisticsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, int>>,
          Map<String, int>,
          FutureOr<Map<String, int>>
        >
    with $FutureModifier<Map<String, int>>, $FutureProvider<Map<String, int>> {
  const RecipeChartStatisticsNotifierProvider._({
    required RecipeChartStatisticsNotifierFamily super.from,
    required DateTimeRange<DateTime> super.argument,
  }) : super(
         retry: null,
         name: r'recipeChartStatisticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeChartStatisticsNotifierHash();

  @override
  String toString() {
    return r'recipeChartStatisticsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, int>> create(Ref ref) {
    final argument = this.argument as DateTimeRange<DateTime>;
    return recipeChartStatisticsNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeChartStatisticsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeChartStatisticsNotifierHash() =>
    r'68767aa82be187afa4202fd55263d6893ae3fb38';

final class RecipeChartStatisticsNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<String, int>>,
          DateTimeRange<DateTime>
        > {
  const RecipeChartStatisticsNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeChartStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeChartStatisticsNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
  ) => RecipeChartStatisticsNotifierProvider._(argument: dateRange, from: this);

  @override
  String toString() => r'recipeChartStatisticsProvider';
}
