// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeChartStatisticsNotifier)
final recipeChartStatisticsProvider = RecipeChartStatisticsNotifierFamily._();

final class RecipeChartStatisticsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, int>>,
          IMap<String, int>,
          FutureOr<IMap<String, int>>
        >
    with
        $FutureModifier<IMap<String, int>>,
        $FutureProvider<IMap<String, int>> {
  RecipeChartStatisticsNotifierProvider._({
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
  $FutureProviderElement<IMap<String, int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<String, int>> create(Ref ref) {
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
    r'5d915f33c66cda56598e486ed4b8156c16b93a23';

final class RecipeChartStatisticsNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<IMap<String, int>>,
          DateTimeRange<DateTime>
        > {
  RecipeChartStatisticsNotifierFamily._()
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
