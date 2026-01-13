// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipeImportScreenNotifier)
final recipeImportScreenProvider = RecipeImportScreenNotifierFamily._();

final class RecipeImportScreenNotifierProvider
    extends
        $AsyncNotifierProvider<RecipeImportScreenNotifier, ImportScreenState> {
  RecipeImportScreenNotifierProvider._({
    required RecipeImportScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeImportScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeImportScreenNotifierHash();

  @override
  String toString() {
    return r'recipeImportScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeImportScreenNotifier create() => RecipeImportScreenNotifier();

  @override
  bool operator ==(Object other) {
    return other is RecipeImportScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeImportScreenNotifierHash() =>
    r'82ac29860810fedc8d1fe2de6218345a9828d06c';

final class RecipeImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeImportScreenNotifier,
          AsyncValue<ImportScreenState>,
          ImportScreenState,
          FutureOr<ImportScreenState>,
          String
        > {
  RecipeImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeImportScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeImportScreenNotifierProvider call(String path) =>
      RecipeImportScreenNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'recipeImportScreenProvider';
}

abstract class _$RecipeImportScreenNotifier
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
