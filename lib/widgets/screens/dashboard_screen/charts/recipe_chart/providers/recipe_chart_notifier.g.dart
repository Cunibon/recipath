// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeChartNotifierHash() =>
    r'bee3b5398f6d8cac2f2617176ae3255432c1f28a';

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

/// See also [recipeChartNotifier].
@ProviderFor(recipeChartNotifier)
const recipeChartNotifierProvider = RecipeChartNotifierFamily();

/// See also [recipeChartNotifier].
class RecipeChartNotifierFamily extends Family<AsyncValue<ChartState>> {
  /// See also [recipeChartNotifier].
  const RecipeChartNotifierFamily();

  /// See also [recipeChartNotifier].
  RecipeChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    List<String> selectedRecipes,
  ) {
    return RecipeChartNotifierProvider(dateRange, selectedRecipes);
  }

  @override
  RecipeChartNotifierProvider getProviderOverride(
    covariant RecipeChartNotifierProvider provider,
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
  String? get name => r'recipeChartNotifierProvider';
}

/// See also [recipeChartNotifier].
class RecipeChartNotifierProvider
    extends AutoDisposeFutureProvider<ChartState> {
  /// See also [recipeChartNotifier].
  RecipeChartNotifierProvider(
    DateTimeRange<DateTime> dateRange,
    List<String> selectedRecipes,
  ) : this._internal(
        (ref) => recipeChartNotifier(
          ref as RecipeChartNotifierRef,
          dateRange,
          selectedRecipes,
        ),
        from: recipeChartNotifierProvider,
        name: r'recipeChartNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeChartNotifierHash,
        dependencies: RecipeChartNotifierFamily._dependencies,
        allTransitiveDependencies:
            RecipeChartNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
        selectedRecipes: selectedRecipes,
      );

  RecipeChartNotifierProvider._internal(
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
    FutureOr<ChartState> Function(RecipeChartNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeChartNotifierProvider._internal(
        (ref) => create(ref as RecipeChartNotifierRef),
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
    return _RecipeChartNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeChartNotifierProvider &&
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
mixin RecipeChartNotifierRef on AutoDisposeFutureProviderRef<ChartState> {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;

  /// The parameter `selectedRecipes` of this provider.
  List<String> get selectedRecipes;
}

class _RecipeChartNotifierProviderElement
    extends AutoDisposeFutureProviderElement<ChartState>
    with RecipeChartNotifierRef {
  _RecipeChartNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as RecipeChartNotifierProvider).dateRange;
  @override
  List<String> get selectedRecipes =>
      (origin as RecipeChartNotifierProvider).selectedRecipes;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
