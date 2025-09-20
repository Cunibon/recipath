// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryChartNotifier)
const groceryChartProvider = GroceryChartNotifierFamily._();

final class GroceryChartNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChartState>,
          ChartState,
          FutureOr<ChartState>
        >
    with $FutureModifier<ChartState>, $FutureProvider<ChartState> {
  const GroceryChartNotifierProvider._({
    required GroceryChartNotifierFamily super.from,
    required (DateTimeRange<DateTime>, Set<String>) super.argument,
  }) : super(
         retry: null,
         name: r'groceryChartProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groceryChartNotifierHash();

  @override
  String toString() {
    return r'groceryChartProvider'
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
    return groceryChartNotifier(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is GroceryChartNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groceryChartNotifierHash() =>
    r'0af752e1604247059e850a49cbc5ada08d48e185';

final class GroceryChartNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ChartState>,
          (DateTimeRange<DateTime>, Set<String>)
        > {
  const GroceryChartNotifierFamily._()
    : super(
        retry: null,
        name: r'groceryChartProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroceryChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    Set<String> selectedRecipes,
  ) => GroceryChartNotifierProvider._(
    argument: (dateRange, selectedRecipes),
    from: this,
  );

  @override
  String toString() => r'groceryChartProvider';
}
