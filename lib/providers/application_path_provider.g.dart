// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(applicationPath)
const applicationPathProvider = ApplicationPathProvider._();

final class ApplicationPathProvider
    extends $FunctionalProvider<Directory, Directory, Directory>
    with $Provider<Directory> {
  const ApplicationPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationPathHash();

  @$internal
  @override
  $ProviderElement<Directory> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Directory create(Ref ref) {
    return applicationPath(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Directory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Directory>(value),
    );
  }
}

String _$applicationPathHash() => r'9d09015e62cc90b6d591b867911b8069e38489f1';
