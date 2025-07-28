// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeChartStatisticsNotifierHash() =>
    r'44f6a8eaeccefe2d677fb97b8e07daafcd0ec05f';

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

/// See also [recipeChartStatisticsNotifier].
@ProviderFor(recipeChartStatisticsNotifier)
const recipeChartStatisticsNotifierProvider =
    RecipeChartStatisticsNotifierFamily();

/// See also [recipeChartStatisticsNotifier].
class RecipeChartStatisticsNotifierFamily
    extends Family<AsyncValue<Map<String, int>>> {
  /// See also [recipeChartStatisticsNotifier].
  const RecipeChartStatisticsNotifierFamily();

  /// See also [recipeChartStatisticsNotifier].
  RecipeChartStatisticsNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
  ) {
    return RecipeChartStatisticsNotifierProvider(dateRange);
  }

  @override
  RecipeChartStatisticsNotifierProvider getProviderOverride(
    covariant RecipeChartStatisticsNotifierProvider provider,
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
  String? get name => r'recipeChartStatisticsNotifierProvider';
}

/// See also [recipeChartStatisticsNotifier].
class RecipeChartStatisticsNotifierProvider
    extends AutoDisposeFutureProvider<Map<String, int>> {
  /// See also [recipeChartStatisticsNotifier].
  RecipeChartStatisticsNotifierProvider(DateTimeRange<DateTime> dateRange)
    : this._internal(
        (ref) => recipeChartStatisticsNotifier(
          ref as RecipeChartStatisticsNotifierRef,
          dateRange,
        ),
        from: recipeChartStatisticsNotifierProvider,
        name: r'recipeChartStatisticsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeChartStatisticsNotifierHash,
        dependencies: RecipeChartStatisticsNotifierFamily._dependencies,
        allTransitiveDependencies:
            RecipeChartStatisticsNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
      );

  RecipeChartStatisticsNotifierProvider._internal(
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
    FutureOr<Map<String, int>> Function(
      RecipeChartStatisticsNotifierRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeChartStatisticsNotifierProvider._internal(
        (ref) => create(ref as RecipeChartStatisticsNotifierRef),
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
  AutoDisposeFutureProviderElement<Map<String, int>> createElement() {
    return _RecipeChartStatisticsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeChartStatisticsNotifierProvider &&
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
mixin RecipeChartStatisticsNotifierRef
    on AutoDisposeFutureProviderRef<Map<String, int>> {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;
}

class _RecipeChartStatisticsNotifierProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, int>>
    with RecipeChartStatisticsNotifierRef {
  _RecipeChartStatisticsNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as RecipeChartStatisticsNotifierProvider).dateRange;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
