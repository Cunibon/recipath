// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groceryChartStatisticsNotifierHash() =>
    r'7ce195a7b57d7f07e7f74b2b75b50a185cb56046';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [groceryChartStatisticsNotifier].
@ProviderFor(groceryChartStatisticsNotifier)
const groceryChartStatisticsNotifierProvider =
    GroceryChartStatisticsNotifierFamily();

/// See also [groceryChartStatisticsNotifier].
class GroceryChartStatisticsNotifierFamily
    extends Family<AsyncValue<Map<String, Map<String, Map<String, double>>>>> {
  /// See also [groceryChartStatisticsNotifier].
  const GroceryChartStatisticsNotifierFamily();

  /// See also [groceryChartStatisticsNotifier].
  GroceryChartStatisticsNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
  ) {
    return GroceryChartStatisticsNotifierProvider(dateRange);
  }

  @override
  GroceryChartStatisticsNotifierProvider getProviderOverride(
    covariant GroceryChartStatisticsNotifierProvider provider,
  ) {
    return call(provider.dateRange);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groceryChartStatisticsNotifierProvider';
}

/// See also [groceryChartStatisticsNotifier].
class GroceryChartStatisticsNotifierProvider
    extends
        AutoDisposeFutureProvider<
          Map<String, Map<String, Map<String, double>>>
        > {
  /// See also [groceryChartStatisticsNotifier].
  GroceryChartStatisticsNotifierProvider(DateTimeRange<DateTime> dateRange)
    : this._internal(
        (ref) => groceryChartStatisticsNotifier(
          ref as GroceryChartStatisticsNotifierRef,
          dateRange,
        ),
        from: groceryChartStatisticsNotifierProvider,
        name: r'groceryChartStatisticsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groceryChartStatisticsNotifierHash,
        dependencies: GroceryChartStatisticsNotifierFamily._dependencies,
        allTransitiveDependencies:
            GroceryChartStatisticsNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
      );

  GroceryChartStatisticsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateRange,
  }) : super.internal();

  final DateTimeRange<DateTime> dateRange;

  @override
  Override overrideWith(
    FutureOr<Map<String, Map<String, Map<String, double>>>> Function(
      GroceryChartStatisticsNotifierRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroceryChartStatisticsNotifierProvider._internal(
        (ref) => create(ref as GroceryChartStatisticsNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateRange: dateRange,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
    Map<String, Map<String, Map<String, double>>>
  >
  createElement() {
    return _GroceryChartStatisticsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroceryChartStatisticsNotifierProvider &&
        other.dateRange == dateRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroceryChartStatisticsNotifierRef
    on
        AutoDisposeFutureProviderRef<
          Map<String, Map<String, Map<String, double>>>
        > {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;
}

class _GroceryChartStatisticsNotifierProviderElement
    extends
        AutoDisposeFutureProviderElement<
          Map<String, Map<String, Map<String, double>>>
        >
    with GroceryChartStatisticsNotifierRef {
  _GroceryChartStatisticsNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as GroceryChartStatisticsNotifierProvider).dateRange;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
