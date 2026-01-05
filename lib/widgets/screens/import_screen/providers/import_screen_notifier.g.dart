// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ImportScreenNotifier)
final importScreenProvider = ImportScreenNotifierFamily._();

final class ImportScreenNotifierProvider
    extends $AsyncNotifierProvider<ImportScreenNotifier, ImportScreenState> {
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
  ImportScreenNotifier create() => ImportScreenNotifier();

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
    r'1d3c995c0b4a26ad35234eeed324de71ed5faa9f';

final class ImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ImportScreenNotifier,
          AsyncValue<ImportScreenState>,
          ImportScreenState,
          FutureOr<ImportScreenState>,
          String
        > {
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

abstract class _$ImportScreenNotifier
    extends $AsyncNotifier<ImportScreenState> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  FutureOr<ImportScreenState> build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ImportScreenState>, ImportScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ImportScreenState>, ImportScreenState>,
              AsyncValue<ImportScreenState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
