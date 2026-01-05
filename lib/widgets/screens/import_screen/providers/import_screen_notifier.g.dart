// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(importScreenNotifier)
final importScreenProvider = ImportScreenNotifierFamily._();

final class ImportScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ImportScreenState>,
          ImportScreenState,
          FutureOr<ImportScreenState>
        >
    with
        $FutureModifier<ImportScreenState>,
        $FutureProvider<ImportScreenState> {
  ImportScreenNotifierProvider._({
    required ImportScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importScreenNotifierHash();

  @override
  String toString() {
    return r'importScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ImportScreenState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ImportScreenState> create(Ref ref) {
    final argument = this.argument as String;
    return importScreenNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportScreenNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importScreenNotifierHash() =>
    r'33c149267db2875c08ed8384279e884495ee7b24';

final class ImportScreenNotifierFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ImportScreenState>, String> {
  ImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'importScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ImportScreenNotifierProvider call(String path) =>
      ImportScreenNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'importScreenProvider';
}
