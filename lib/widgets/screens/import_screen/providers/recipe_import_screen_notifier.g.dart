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
        $AsyncNotifierProvider<
          RecipeImportScreenNotifier,
          RecipeImportScreenState
        > {
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
    r'b076c2425fc3bc77b4b9719d380d754c1b305c71';

final class RecipeImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeImportScreenNotifier,
          AsyncValue<RecipeImportScreenState>,
          RecipeImportScreenState,
          FutureOr<RecipeImportScreenState>,
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
    extends $AsyncNotifier<RecipeImportScreenState> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  FutureOr<RecipeImportScreenState> build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<RecipeImportScreenState>,
              RecipeImportScreenState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<RecipeImportScreenState>,
                RecipeImportScreenState
              >,
              AsyncValue<RecipeImportScreenState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
