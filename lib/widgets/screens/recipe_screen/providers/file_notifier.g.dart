// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localFileHash() => r'31ff5fb5d39edef5c4de59a744f98034436006be';

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
  LocalFileProvider call({required String bucket, required String fileName}) {
    return LocalFileProvider(bucket: bucket, fileName: fileName);
  }

  @override
  LocalFileProvider getProviderOverride(covariant LocalFileProvider provider) {
    return call(bucket: provider.bucket, fileName: provider.fileName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localFileProvider';
}

/// See also [localFile].
class LocalFileProvider extends AutoDisposeFutureProvider<File> {
  /// See also [localFile].
  LocalFileProvider({required String bucket, required String fileName})
    : this._internal(
        (ref) =>
            localFile(ref as LocalFileRef, bucket: bucket, fileName: fileName),
        from: localFileProvider,
        name: r'localFileProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$localFileHash,
        dependencies: LocalFileFamily._dependencies,
        allTransitiveDependencies: LocalFileFamily._allTransitiveDependencies,
        bucket: bucket,
        fileName: fileName,
      );

  LocalFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bucket,
    required this.fileName,
  }) : super.internal();

  final String bucket;
  final String fileName;

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
        bucket: bucket,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File> createElement() {
    return _LocalFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalFileProvider &&
        other.bucket == bucket &&
        other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bucket.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocalFileRef on AutoDisposeFutureProviderRef<File> {
  /// The parameter `bucket` of this provider.
  String get bucket;

  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _LocalFileProviderElement extends AutoDisposeFutureProviderElement<File>
    with LocalFileRef {
  _LocalFileProviderElement(super.provider);

  @override
  String get bucket => (origin as LocalFileProvider).bucket;
  @override
  String get fileName => (origin as LocalFileProvider).fileName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
