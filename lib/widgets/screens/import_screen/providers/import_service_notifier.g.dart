// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(importServiceNotifier)
final importServiceProvider = ImportServiceNotifierFamily._();

final class ImportServiceNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ImportService>,
          ImportService,
          FutureOr<ImportService>
        >
    with $FutureModifier<ImportService>, $FutureProvider<ImportService> {
  ImportServiceNotifierProvider._({
    required ImportServiceNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importServiceNotifierHash();

  @override
  String toString() {
    return r'importServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ImportService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ImportService> create(Ref ref) {
    final argument = this.argument as String;
    return importServiceNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportServiceNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importServiceNotifierHash() =>
    r'c5b83491f627b7fcab6b2417375df9f9746d3de6';

final class ImportServiceNotifierFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ImportService>, String> {
  ImportServiceNotifierFamily._()
    : super(
        retry: null,
        name: r'importServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ImportServiceNotifierProvider call(String path) =>
      ImportServiceNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'importServiceProvider';
}
