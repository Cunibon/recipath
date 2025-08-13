// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_recipe_time_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$averageRecipeTimeNotifierHash() =>
    r'949fcbff3cce9fc7def3f7852816cfc6e1a89b7b';

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

/// See also [averageRecipeTimeNotifier].
@ProviderFor(averageRecipeTimeNotifier)
const averageRecipeTimeNotifierProvider = AverageRecipeTimeNotifierFamily();

/// See also [averageRecipeTimeNotifier].
class AverageRecipeTimeNotifierFamily extends Family<AsyncValue<Duration?>> {
  /// See also [averageRecipeTimeNotifier].
  const AverageRecipeTimeNotifierFamily();

  /// See also [averageRecipeTimeNotifier].
  AverageRecipeTimeNotifierProvider call(String recipeId) {
    return AverageRecipeTimeNotifierProvider(recipeId);
  }

  @override
  AverageRecipeTimeNotifierProvider getProviderOverride(
    covariant AverageRecipeTimeNotifierProvider provider,
  ) {
    return call(provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'averageRecipeTimeNotifierProvider';
}

/// See also [averageRecipeTimeNotifier].
class AverageRecipeTimeNotifierProvider
    extends AutoDisposeStreamProvider<Duration?> {
  /// See also [averageRecipeTimeNotifier].
  AverageRecipeTimeNotifierProvider(String recipeId)
    : this._internal(
        (ref) => averageRecipeTimeNotifier(
          ref as AverageRecipeTimeNotifierRef,
          recipeId,
        ),
        from: averageRecipeTimeNotifierProvider,
        name: r'averageRecipeTimeNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$averageRecipeTimeNotifierHash,
        dependencies: AverageRecipeTimeNotifierFamily._dependencies,
        allTransitiveDependencies:
            AverageRecipeTimeNotifierFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  AverageRecipeTimeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String recipeId;

  @override
  Override overrideWith(
    Stream<Duration?> Function(AverageRecipeTimeNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AverageRecipeTimeNotifierProvider._internal(
        (ref) => create(ref as AverageRecipeTimeNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Duration?> createElement() {
    return _AverageRecipeTimeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AverageRecipeTimeNotifierProvider &&
        other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AverageRecipeTimeNotifierRef on AutoDisposeStreamProviderRef<Duration?> {
  /// The parameter `recipeId` of this provider.
  String get recipeId;
}

class _AverageRecipeTimeNotifierProviderElement
    extends AutoDisposeStreamProviderElement<Duration?>
    with AverageRecipeTimeNotifierRef {
  _AverageRecipeTimeNotifierProviderElement(super.provider);

  @override
  String get recipeId => (origin as AverageRecipeTimeNotifierProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
