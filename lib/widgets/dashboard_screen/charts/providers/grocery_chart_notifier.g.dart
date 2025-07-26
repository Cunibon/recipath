// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groceryChartNotifierHash() =>
    r'3e864541633a0d0d1f5254160717b90f35ee3587';

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

/// See also [groceryChartNotifier].
@ProviderFor(groceryChartNotifier)
const groceryChartNotifierProvider = GroceryChartNotifierFamily();

/// See also [groceryChartNotifier].
class GroceryChartNotifierFamily extends Family<AsyncValue<ChartState>> {
  /// See also [groceryChartNotifier].
  const GroceryChartNotifierFamily();

  /// See also [groceryChartNotifier].
  GroceryChartNotifierProvider call(DateTimeRange<DateTime> dateRange) {
    return GroceryChartNotifierProvider(dateRange);
  }

  @override
  GroceryChartNotifierProvider getProviderOverride(
    covariant GroceryChartNotifierProvider provider,
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
  String? get name => r'groceryChartNotifierProvider';
}

/// See also [groceryChartNotifier].
class GroceryChartNotifierProvider
    extends AutoDisposeFutureProvider<ChartState> {
  /// See also [groceryChartNotifier].
  GroceryChartNotifierProvider(DateTimeRange<DateTime> dateRange)
    : this._internal(
        (ref) =>
            groceryChartNotifier(ref as GroceryChartNotifierRef, dateRange),
        from: groceryChartNotifierProvider,
        name: r'groceryChartNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groceryChartNotifierHash,
        dependencies: GroceryChartNotifierFamily._dependencies,
        allTransitiveDependencies:
            GroceryChartNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
      );

  GroceryChartNotifierProvider._internal(
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
    FutureOr<ChartState> Function(GroceryChartNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroceryChartNotifierProvider._internal(
        (ref) => create(ref as GroceryChartNotifierRef),
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
  AutoDisposeFutureProviderElement<ChartState> createElement() {
    return _GroceryChartNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroceryChartNotifierProvider &&
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
mixin GroceryChartNotifierRef on AutoDisposeFutureProviderRef<ChartState> {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;
}

class _GroceryChartNotifierProviderElement
    extends AutoDisposeFutureProviderElement<ChartState>
    with GroceryChartNotifierRef {
  _GroceryChartNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as GroceryChartNotifierProvider).dateRange;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
