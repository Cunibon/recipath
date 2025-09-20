// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryChartStatisticsNotifier)
const groceryChartStatisticsProvider = GroceryChartStatisticsNotifierFamily._();

final class GroceryChartStatisticsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Map<String, Map<String, double>>>>,
          Map<String, Map<String, Map<String, double>>>,
          FutureOr<Map<String, Map<String, Map<String, double>>>>
        >
    with
        $FutureModifier<Map<String, Map<String, Map<String, double>>>>,
        $FutureProvider<Map<String, Map<String, Map<String, double>>>> {
  const GroceryChartStatisticsNotifierProvider._({
    required GroceryChartStatisticsNotifierFamily super.from,
    required DateTimeRange<DateTime> super.argument,
  }) : super(
         retry: null,
         name: r'groceryChartStatisticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groceryChartStatisticsNotifierHash();

  @override
  String toString() {
    return r'groceryChartStatisticsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, Map<String, Map<String, double>>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Map<String, Map<String, double>>>> create(Ref ref) {
    final argument = this.argument as DateTimeRange<DateTime>;
    return groceryChartStatisticsNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroceryChartStatisticsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groceryChartStatisticsNotifierHash() =>
    r'7ce195a7b57d7f07e7f74b2b75b50a185cb56046';

final class GroceryChartStatisticsNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<String, Map<String, Map<String, double>>>>,
          DateTimeRange<DateTime>
        > {
  const GroceryChartStatisticsNotifierFamily._()
    : super(
        retry: null,
        name: r'groceryChartStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroceryChartStatisticsNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
  ) =>
      GroceryChartStatisticsNotifierProvider._(argument: dateRange, from: this);

  @override
  String toString() => r'groceryChartStatisticsProvider';
}
