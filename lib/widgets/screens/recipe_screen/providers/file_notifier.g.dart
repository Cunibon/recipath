// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localFile)
const localFileProvider = LocalFileFamily._();

final class LocalFileProvider
    extends $FunctionalProvider<AsyncValue<File>, File, FutureOr<File>>
    with $FutureModifier<File>, $FutureProvider<File> {
  const LocalFileProvider._({
    required LocalFileFamily super.from,
    required ({String bucket, String fileName}) super.argument,
  }) : super(
         retry: null,
         name: r'localFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localFileHash();

  @override
  String toString() {
    return r'localFileProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<File> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<File> create(Ref ref) {
    final argument = this.argument as ({String bucket, String fileName});
    return localFile(ref, bucket: argument.bucket, fileName: argument.fileName);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localFileHash() => r'31ff5fb5d39edef5c4de59a744f98034436006be';

final class LocalFileFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<File>,
          ({String bucket, String fileName})
        > {
  const LocalFileFamily._()
    : super(
        retry: null,
        name: r'localFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LocalFileProvider call({required String bucket, required String fileName}) =>
      LocalFileProvider._(
        argument: (bucket: bucket, fileName: fileName),
        from: this,
      );

  @override
  String toString() => r'localFileProvider';
}
