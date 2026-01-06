// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_file_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localFileNotifier)
final localFileProvider = LocalFileNotifierFamily._();

final class LocalFileNotifierProvider
    extends $FunctionalProvider<File, File, File>
    with $Provider<File> {
  LocalFileNotifierProvider._({
    required LocalFileNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'localFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localFileNotifierHash();

  @override
  String toString() {
    return r'localFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<File> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  File create(Ref ref) {
    final argument = this.argument as String;
    return localFileNotifier(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(File value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<File>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LocalFileNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localFileNotifierHash() => r'40f9fc0c01bb7c24afee3b7d8617eca9275e812c';

final class LocalFileNotifierFamily extends $Family
    with $FunctionalFamilyOverride<File, String> {
  LocalFileNotifierFamily._()
    : super(
        retry: null,
        name: r'localFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LocalFileNotifierProvider call(String fileName) =>
      LocalFileNotifierProvider._(argument: fileName, from: this);

  @override
  String toString() => r'localFileProvider';
}
