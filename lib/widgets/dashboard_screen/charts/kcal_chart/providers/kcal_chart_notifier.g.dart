// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kcal_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kcalChartNotifierHash() => r'1cd25133905dbb3202e9c477bfa3ce029a1fb45f';

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

/// See also [kcalChartNotifier].
@ProviderFor(kcalChartNotifier)
const kcalChartNotifierProvider = KcalChartNotifierFamily();

/// See also [kcalChartNotifier].
class KcalChartNotifierFamily extends Family<AsyncValue<ChartState>> {
  /// See also [kcalChartNotifier].
  const KcalChartNotifierFamily();

  /// See also [kcalChartNotifier].
  KcalChartNotifierProvider call(
    DateTimeRange<DateTime> dateRange,
    String? recipeId,
  ) {
    return KcalChartNotifierProvider(dateRange, recipeId);
  }

  @override
  KcalChartNotifierProvider getProviderOverride(
    covariant KcalChartNotifierProvider provider,
  ) {
    return call(provider.dateRange, provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'kcalChartNotifierProvider';
}

/// See also [kcalChartNotifier].
class KcalChartNotifierProvider extends AutoDisposeFutureProvider<ChartState> {
  /// See also [kcalChartNotifier].
  KcalChartNotifierProvider(DateTimeRange<DateTime> dateRange, String? recipeId)
    : this._internal(
        (ref) =>
            kcalChartNotifier(ref as KcalChartNotifierRef, dateRange, recipeId),
        from: kcalChartNotifierProvider,
        name: r'kcalChartNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$kcalChartNotifierHash,
        dependencies: KcalChartNotifierFamily._dependencies,
        allTransitiveDependencies:
            KcalChartNotifierFamily._allTransitiveDependencies,
        dateRange: dateRange,
        recipeId: recipeId,
      );

  KcalChartNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateRange,
    required this.recipeId,
  }) : super.internal();

  final DateTimeRange<DateTime> dateRange;
  final String? recipeId;

  @override
  Override overrideWith(
    FutureOr<ChartState> Function(KcalChartNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KcalChartNotifierProvider._internal(
        (ref) => create(ref as KcalChartNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateRange: dateRange,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChartState> createElement() {
    return _KcalChartNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KcalChartNotifierProvider &&
        other.dateRange == dateRange &&
        other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateRange.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin KcalChartNotifierRef on AutoDisposeFutureProviderRef<ChartState> {
  /// The parameter `dateRange` of this provider.
  DateTimeRange<DateTime> get dateRange;

  /// The parameter `recipeId` of this provider.
  String? get recipeId;
}

class _KcalChartNotifierProviderElement
    extends AutoDisposeFutureProviderElement<ChartState>
    with KcalChartNotifierRef {
  _KcalChartNotifierProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get dateRange =>
      (origin as KcalChartNotifierProvider).dateRange;
  @override
  String? get recipeId => (origin as KcalChartNotifierProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
