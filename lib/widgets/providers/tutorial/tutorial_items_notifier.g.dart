// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_items_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorialItemsNotifierHash() =>
    r'3115de5d50137ed38a5ba4d68b135a6ec74e130a';

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

/// See also [tutorialItemsNotifier].
@ProviderFor(tutorialItemsNotifier)
const tutorialItemsNotifierProvider = TutorialItemsNotifierFamily();

/// See also [tutorialItemsNotifier].
class TutorialItemsNotifierFamily extends Family<TutorialItems> {
  /// See also [tutorialItemsNotifier].
  const TutorialItemsNotifierFamily();

  /// See also [tutorialItemsNotifier].
  TutorialItemsNotifierProvider call(String identifier) {
    return TutorialItemsNotifierProvider(identifier);
  }

  @override
  TutorialItemsNotifierProvider getProviderOverride(
    covariant TutorialItemsNotifierProvider provider,
  ) {
    return call(provider.identifier);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tutorialItemsNotifierProvider';
}

/// See also [tutorialItemsNotifier].
class TutorialItemsNotifierProvider extends Provider<TutorialItems> {
  /// See also [tutorialItemsNotifier].
  TutorialItemsNotifierProvider(String identifier)
    : this._internal(
        (ref) =>
            tutorialItemsNotifier(ref as TutorialItemsNotifierRef, identifier),
        from: tutorialItemsNotifierProvider,
        name: r'tutorialItemsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$tutorialItemsNotifierHash,
        dependencies: TutorialItemsNotifierFamily._dependencies,
        allTransitiveDependencies:
            TutorialItemsNotifierFamily._allTransitiveDependencies,
        identifier: identifier,
      );

  TutorialItemsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.identifier,
  }) : super.internal();

  final String identifier;

  @override
  Override overrideWith(
    TutorialItems Function(TutorialItemsNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TutorialItemsNotifierProvider._internal(
        (ref) => create(ref as TutorialItemsNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        identifier: identifier,
      ),
    );
  }

  @override
  ProviderElement<TutorialItems> createElement() {
    return _TutorialItemsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TutorialItemsNotifierProvider &&
        other.identifier == identifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, identifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TutorialItemsNotifierRef on ProviderRef<TutorialItems> {
  /// The parameter `identifier` of this provider.
  String get identifier;
}

class _TutorialItemsNotifierProviderElement
    extends ProviderElement<TutorialItems>
    with TutorialItemsNotifierRef {
  _TutorialItemsNotifierProviderElement(super.provider);

  @override
  String get identifier => (origin as TutorialItemsNotifierProvider).identifier;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
