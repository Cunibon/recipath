// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag_import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipeTagImportScreenNotifier)
final recipeTagImportScreenProvider = RecipeTagImportScreenNotifierFamily._();

final class RecipeTagImportScreenNotifierProvider
    extends
        $AsyncNotifierProvider<
          RecipeTagImportScreenNotifier,
          TagImportScreenState
        > {
  RecipeTagImportScreenNotifierProvider._({
    required RecipeTagImportScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeTagImportScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeTagImportScreenNotifierHash();

  @override
  String toString() {
    return r'recipeTagImportScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeTagImportScreenNotifier create() => RecipeTagImportScreenNotifier();

  @override
  bool operator ==(Object other) {
    return other is RecipeTagImportScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeTagImportScreenNotifierHash() =>
    r'f2c9be9a2f90cf60f612953495b791081416a6c4';

final class RecipeTagImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeTagImportScreenNotifier,
          AsyncValue<TagImportScreenState>,
          TagImportScreenState,
          FutureOr<TagImportScreenState>,
          String
        > {
  RecipeTagImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeTagImportScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeTagImportScreenNotifierProvider call(String path) =>
      RecipeTagImportScreenNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'recipeTagImportScreenProvider';
}

abstract class _$RecipeTagImportScreenNotifier
    extends $AsyncNotifier<TagImportScreenState> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  FutureOr<TagImportScreenState> build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<TagImportScreenState>, TagImportScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<TagImportScreenState>,
                TagImportScreenState
              >,
              AsyncValue<TagImportScreenState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
