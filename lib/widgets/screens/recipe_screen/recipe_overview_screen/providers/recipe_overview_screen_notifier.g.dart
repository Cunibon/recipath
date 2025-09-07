// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_overview_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeOverviewScreenNotifierHash() =>
    r'10099e4096269b580b8559715c6ac9af3e9f77c7';

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

abstract class _$RecipeOverviewScreenNotifier
    extends BuildlessAutoDisposeNotifier<RecipeOverviewScreenState> {
  late final String recipeId;

  RecipeOverviewScreenState build(String recipeId);
}

/// See also [RecipeOverviewScreenNotifier].
@ProviderFor(RecipeOverviewScreenNotifier)
const recipeOverviewScreenNotifierProvider =
    RecipeOverviewScreenNotifierFamily();

/// See also [RecipeOverviewScreenNotifier].
class RecipeOverviewScreenNotifierFamily
    extends Family<RecipeOverviewScreenState> {
  /// See also [RecipeOverviewScreenNotifier].
  const RecipeOverviewScreenNotifierFamily();

  /// See also [RecipeOverviewScreenNotifier].
  RecipeOverviewScreenNotifierProvider call(String recipeId) {
    return RecipeOverviewScreenNotifierProvider(recipeId);
  }

  @override
  RecipeOverviewScreenNotifierProvider getProviderOverride(
    covariant RecipeOverviewScreenNotifierProvider provider,
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
  String? get name => r'recipeOverviewScreenNotifierProvider';
}

/// See also [RecipeOverviewScreenNotifier].
class RecipeOverviewScreenNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          RecipeOverviewScreenNotifier,
          RecipeOverviewScreenState
        > {
  /// See also [RecipeOverviewScreenNotifier].
  RecipeOverviewScreenNotifierProvider(String recipeId)
    : this._internal(
        () => RecipeOverviewScreenNotifier()..recipeId = recipeId,
        from: recipeOverviewScreenNotifierProvider,
        name: r'recipeOverviewScreenNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeOverviewScreenNotifierHash,
        dependencies: RecipeOverviewScreenNotifierFamily._dependencies,
        allTransitiveDependencies:
            RecipeOverviewScreenNotifierFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  RecipeOverviewScreenNotifierProvider._internal(
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
  RecipeOverviewScreenState runNotifierBuild(
    covariant RecipeOverviewScreenNotifier notifier,
  ) {
    return notifier.build(recipeId);
  }

  @override
  Override overrideWith(RecipeOverviewScreenNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeOverviewScreenNotifierProvider._internal(
        () => create()..recipeId = recipeId,
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
  AutoDisposeNotifierProviderElement<
    RecipeOverviewScreenNotifier,
    RecipeOverviewScreenState
  >
  createElement() {
    return _RecipeOverviewScreenNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeOverviewScreenNotifierProvider &&
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
mixin RecipeOverviewScreenNotifierRef
    on AutoDisposeNotifierProviderRef<RecipeOverviewScreenState> {
  /// The parameter `recipeId` of this provider.
  String get recipeId;
}

class _RecipeOverviewScreenNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          RecipeOverviewScreenNotifier,
          RecipeOverviewScreenState
        >
    with RecipeOverviewScreenNotifierRef {
  _RecipeOverviewScreenNotifierProviderElement(super.provider);

  @override
  String get recipeId =>
      (origin as RecipeOverviewScreenNotifierProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
