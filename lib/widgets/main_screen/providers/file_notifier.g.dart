// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localFileHash() => r'beabd491bcc4a5c132854fad90f841b8c0802a19';

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

/// See also [localFile].
@ProviderFor(localFile)
const localFileProvider = LocalFileFamily();

/// See also [localFile].
class LocalFileFamily extends Family<AsyncValue<File>> {
  /// See also [localFile].
  const LocalFileFamily();

  /// See also [localFile].
  LocalFileProvider call(String file) {
    return LocalFileProvider(file);
  }

  @override
  LocalFileProvider getProviderOverride(covariant LocalFileProvider provider) {
    return call(provider.file);
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    applicationPathProvider,
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
        applicationPathProvider,
        ...?applicationPathProvider.allTransitiveDependencies,
      };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localFileProvider';
}

/// See also [localFile].
class LocalFileProvider extends AutoDisposeFutureProvider<File> {
  /// See also [localFile].
  LocalFileProvider(String file)
    : this._internal(
        (ref) => localFile(ref as LocalFileRef, file),
        from: localFileProvider,
        name: r'localFileProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$localFileHash,
        dependencies: LocalFileFamily._dependencies,
        allTransitiveDependencies: LocalFileFamily._allTransitiveDependencies,
        file: file,
      );

  LocalFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
  }) : super.internal();

  final String file;

  @override
  Override overrideWith(FutureOr<File> Function(LocalFileRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: LocalFileProvider._internal(
        (ref) => create(ref as LocalFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File> createElement() {
    return _LocalFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalFileProvider && other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocalFileRef on AutoDisposeFutureProviderRef<File> {
  /// The parameter `file` of this provider.
  String get file;
}

class _LocalFileProviderElement extends AutoDisposeFutureProviderElement<File>
    with LocalFileRef {
  _LocalFileProviderElement(super.provider);

  @override
  String get file => (origin as LocalFileProvider).file;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
