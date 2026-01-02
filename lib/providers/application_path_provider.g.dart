// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(applicationPath)
final applicationPathProvider = ApplicationPathProvider._();

final class ApplicationPathProvider
    extends $FunctionalProvider<Directory, Directory, Directory>
    with $Provider<Directory> {
  ApplicationPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationPathProvider',
        isAutoDispose: false,
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

String _$applicationPathHash() => r'5d58a1209662ae2090b0c175d4ab51896e732eec';
