// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileModifierNotifier)
const fileModifierProvider = FileModifierNotifierProvider._();

final class FileModifierNotifierProvider
    extends $FunctionalProvider<FileModifier, FileModifier, FileModifier>
    with $Provider<FileModifier> {
  const FileModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<FileModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FileModifier create(Ref ref) {
    return fileModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FileModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FileModifier>(value),
    );
  }
}

String _$fileModifierNotifierHash() =>
    r'77856d70912704e4f8ee564ccdfa6fea22ba2020';
