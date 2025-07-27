// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groceryStatisticsNotifierProviderHash() =>
    r'0127d03b55f70070821aab82415e53aca938da80';

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

/// See also [groceryStatisticsNotifierProvider].
@ProviderFor(groceryStatisticsNotifierProvider)
const groceryStatisticsNotifierProviderProvider =
    GroceryStatisticsNotifierProviderFamily();

/// See also [groceryStatisticsNotifierProvider].
class GroceryStatisticsNotifierProviderFamily
    extends Family<AsyncValue<Map<String, Map<String, Map<String, double>>>>> {
  /// See also [groceryStatisticsNotifierProvider].
  const GroceryStatisticsNotifierProviderFamily();

  /// See also [groceryStatisticsNotifierProvider].
  GroceryStatisticsNotifierProviderProvider call(
    DateTimeRange<DateTime> dateRange,
  ) {
    return GroceryStatisticsNotifierProviderProvider(dateRange);
  }

  @override
  GroceryStatisticsNotifierProviderProvider getProviderOverride(
    covariant GroceryStatisticsNotifierProviderProvider provider,
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
  String? get name => r'groceryStatisticsNotifierProviderProvider';
}

/// See also [groceryStatisticsNotifierProvider].
class GroceryStatisticsNotifierProviderProvider
    extends
        AutoDisposeFutureProvider<
          Map<String, Map<String, Map<String, double>>>
        > {
  /// See also [groceryStatisticsNotifierProvider].
  GroceryStatisticsNotifierProviderProvider(DateTimeRange<DateTime> dateRange)
    : this._internal(
        (ref) => groceryStatisticsNotifierProvider(
          ref as GroceryStatisticsNotifierProviderRef,
          dateRange,
        ),
        from: groceryStatisticsNotifierProviderProvider,
        name: r'groceryStatisticsNotifierProviderProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groceryStatisticsNotifierProviderHash,
        dependencies: GroceryStatisticsNotifierProviderFamily._dependencies,
        allTransitiveDependencies:
            GroceryStatisticsNotifierProviderFamily._allTransitiveDependencies,
        dateRange: dateRange,
      );

  GroceryStatisticsNotifierProviderProvider._internal(
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
      GroceryStatisticsNotifierProviderRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroceryStatisticsNotifierProviderProvider._internal(
        (ref) => create(ref as GroceryStatisticsNotifierProviderRef),
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
    return _GroceryStatisticsNotifierProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroceryStatisticsNotifierProviderProvider &&
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
mixin GroceryStatisticsNotifierProviderRef
    on
        AutoDisposeFutureProviderRef<
          Map<String, Map<String, Map<String, double>>>
        > {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;
}

class _GroceryStatisticsNotifierProviderProviderElement
    extends
        AutoDisposeFutureProviderElement<
          Map<String, Map<String, Map<String, double>>>
        >
    with GroceryStatisticsNotifierProviderRef {
  _GroceryStatisticsNotifierProviderProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as GroceryStatisticsNotifierProviderProvider).dateRange;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
