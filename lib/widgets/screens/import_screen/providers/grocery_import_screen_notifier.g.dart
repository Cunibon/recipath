// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroceryImportScreenNotifier)
final groceryImportScreenProvider = GroceryImportScreenNotifierFamily._();

final class GroceryImportScreenNotifierProvider
    extends
        $AsyncNotifierProvider<
          GroceryImportScreenNotifier,
          Map<String, GroceryData?>
        > {
  GroceryImportScreenNotifierProvider._({
    required GroceryImportScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groceryImportScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groceryImportScreenNotifierHash();

  @override
  String toString() {
    return r'groceryImportScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroceryImportScreenNotifier create() => GroceryImportScreenNotifier();

  @override
  bool operator ==(Object other) {
    return other is GroceryImportScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groceryImportScreenNotifierHash() =>
    r'59797e55e80cc26b18da22657e60454bff2de55c';

final class GroceryImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GroceryImportScreenNotifier,
          AsyncValue<Map<String, GroceryData?>>,
          Map<String, GroceryData?>,
          FutureOr<Map<String, GroceryData?>>,
          String
        > {
  GroceryImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'groceryImportScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroceryImportScreenNotifierProvider call(String path) =>
      GroceryImportScreenNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'groceryImportScreenProvider';
}

abstract class _$GroceryImportScreenNotifier
    extends $AsyncNotifier<Map<String, GroceryData?>> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  FutureOr<Map<String, GroceryData?>> build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, GroceryData?>>,
              Map<String, GroceryData?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, GroceryData?>>,
                Map<String, GroceryData?>
              >,
              AsyncValue<Map<String, GroceryData?>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
