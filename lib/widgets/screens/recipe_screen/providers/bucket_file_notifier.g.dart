// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_file_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bucketFileNotifier)
final bucketFileProvider = BucketFileNotifierFamily._();

final class BucketFileNotifierProvider
    extends $FunctionalProvider<AsyncValue<File>, File, FutureOr<File>>
    with $FutureModifier<File>, $FutureProvider<File> {
  BucketFileNotifierProvider._({
    required BucketFileNotifierFamily super.from,
    required ({String bucket, String fileName}) super.argument,
  }) : super(
         retry: null,
         name: r'bucketFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bucketFileNotifierHash();

  @override
  String toString() {
    return r'bucketFileProvider'
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
    return bucketFileNotifier(
      ref,
      bucket: argument.bucket,
      fileName: argument.fileName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BucketFileNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bucketFileNotifierHash() =>
    r'e5bdac8e1e38259fa9018bc4c31ca499a0a9103d';

final class BucketFileNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<File>,
          ({String bucket, String fileName})
        > {
  BucketFileNotifierFamily._()
    : super(
        retry: null,
        name: r'bucketFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BucketFileNotifierProvider call({
    required String bucket,
    required String fileName,
  }) => BucketFileNotifierProvider._(
    argument: (bucket: bucket, fileName: fileName),
    from: this,
  );

  @override
  String toString() => r'bucketFileProvider';
}
