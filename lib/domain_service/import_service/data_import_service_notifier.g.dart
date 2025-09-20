// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_import_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dataImportServiceNotifier)
const dataImportServiceProvider = DataImportServiceNotifierProvider._();

final class DataImportServiceNotifierProvider
    extends
        $FunctionalProvider<
          DataImportService,
          DataImportService,
          DataImportService
        >
    with $Provider<DataImportService> {
  const DataImportServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataImportServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataImportServiceNotifierHash();

  @$internal
  @override
  $ProviderElement<DataImportService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DataImportService create(Ref ref) {
    return dataImportServiceNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataImportService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataImportService>(value),
    );
  }
}

String _$dataImportServiceNotifierHash() =>
    r'7fc62c7b9394fdaa3d6bc3773aa070f4aa7d9c17';
