// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_data_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(importDataNotifier)
final importDataProvider = ImportDataNotifierFamily._();

final class ImportDataNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ImportData>,
          ImportData,
          FutureOr<ImportData>
        >
    with $FutureModifier<ImportData>, $FutureProvider<ImportData> {
  ImportDataNotifierProvider._({
    required ImportDataNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importDataNotifierHash();

  @override
  String toString() {
    return r'importDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ImportData> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ImportData> create(Ref ref) {
    final argument = this.argument as String;
    return importDataNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportDataNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importDataNotifierHash() =>
    r'ff2e4fd9754aedd24f233a8db4ab7211f1f3bd22';

final class ImportDataNotifierFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ImportData>, String> {
  ImportDataNotifierFamily._()
    : super(
        retry: null,
        name: r'importDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ImportDataNotifierProvider call(String path) =>
      ImportDataNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'importDataProvider';
}
