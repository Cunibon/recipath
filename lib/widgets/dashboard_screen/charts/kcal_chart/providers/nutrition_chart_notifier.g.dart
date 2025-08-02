// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nutritionChartNotifierHash() =>
    r'7aeeea05a68f729500dcf8bc23314e5e756b2f31';

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

/// See also [nutritionChartNotifier].
@ProviderFor(nutritionChartNotifier)
const nutritionChartNotifierProvider = NutritionChartNotifierFamily();

/// See also [nutritionChartNotifier].
class NutritionChartNotifierFamily extends Family<AsyncValue<ChartState>> {
  /// See also [nutritionChartNotifier].
  const NutritionChartNotifierFamily();

  /// See also [nutritionChartNotifier].
  NutritionChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    List<String> selectedRecipes,
  ) {
    return NutritionChartNotifierProvider(dateRange, selectedRecipes);
  }

  @override
  NutritionChartNotifierProvider getProviderOverride(
    covariant NutritionChartNotifierProvider provider,
  ) {
    return call(provider.dateRange, provider.selectedRecipes);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nutritionChartNotifierProvider';
}

/// See also [nutritionChartNotifier].
class NutritionChartNotifierProvider
    extends AutoDisposeFutureProvider<ChartState> {
  /// See also [nutritionChartNotifier].
  NutritionChartNotifierProvider(
    DateTimeRange<DateTime> dateRange,
    List<String> selectedRecipes,
  ) : this._internal(
        (ref) => nutritionChartNotifier(
          ref as NutritionChartNotifierRef,
          dateRange,
          selectedRecipes,
        ),
        from: nutritionChartNotifierProvider,
        name: r'nutritionChartNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$nutritionChartNotifierHash,
        dependencies: NutritionChartNotifierFamily._dependencies,
        allTransitiveDependencies:
            NutritionChartNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
        selectedRecipes: selectedRecipes,
      );

  NutritionChartNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateRange,
    required this.selectedRecipes,
  }) : super.internal();

  final DateTimeRange<DateTime> dateRange;
  final List<String> selectedRecipes;

  @override
  Override overrideWith(
    FutureOr<ChartState> Function(NutritionChartNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NutritionChartNotifierProvider._internal(
        (ref) => create(ref as NutritionChartNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateRange: dateRange,
        selectedRecipes: selectedRecipes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChartState> createElement() {
    return _NutritionChartNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NutritionChartNotifierProvider &&
        other.dateRange == dateRange &&
        other.selectedRecipes == selectedRecipes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateRange.hashCode);
    hash = _SystemHash.combine(hash, selectedRecipes.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NutritionChartNotifierRef on AutoDisposeFutureProviderRef<ChartState> {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;

  /// The parameter `selectedRecipes` of this provider.
  List<String> get selectedRecipes;
}

class _NutritionChartNotifierProviderElement
    extends AutoDisposeFutureProviderElement<ChartState>
    with NutritionChartNotifierRef {
  _NutritionChartNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as NutritionChartNotifierProvider).dateRange;
  @override
  List<String> get selectedRecipes =>
      (origin as NutritionChartNotifierProvider).selectedRecipes;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
