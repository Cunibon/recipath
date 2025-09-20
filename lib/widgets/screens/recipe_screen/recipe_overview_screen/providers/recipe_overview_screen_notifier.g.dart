// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_overview_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipeOverviewScreenNotifier)
const recipeOverviewScreenProvider = RecipeOverviewScreenNotifierFamily._();

final class RecipeOverviewScreenNotifierProvider
    extends
        $NotifierProvider<
          RecipeOverviewScreenNotifier,
          RecipeOverviewScreenState
        > {
  const RecipeOverviewScreenNotifierProvider._({
    required RecipeOverviewScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeOverviewScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeOverviewScreenNotifierHash();

  @override
  String toString() {
    return r'recipeOverviewScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeOverviewScreenNotifier create() => RecipeOverviewScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeOverviewScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeOverviewScreenState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeOverviewScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeOverviewScreenNotifierHash() =>
    r'bdfa6754ed4cc1ca9ce789d86afd07754a96c1b7';

final class RecipeOverviewScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeOverviewScreenNotifier,
          RecipeOverviewScreenState,
          RecipeOverviewScreenState,
          RecipeOverviewScreenState,
          String
        > {
  const RecipeOverviewScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeOverviewScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeOverviewScreenNotifierProvider call(String recipeId) =>
      RecipeOverviewScreenNotifierProvider._(argument: recipeId, from: this);

  @override
  String toString() => r'recipeOverviewScreenProvider';
}

abstract class _$RecipeOverviewScreenNotifier
    extends $Notifier<RecipeOverviewScreenState> {
  late final _$args = ref.$arg as String;
  String get recipeId => _$args;

  RecipeOverviewScreenState build(String recipeId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<RecipeOverviewScreenState, RecipeOverviewScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecipeOverviewScreenState, RecipeOverviewScreenState>,
              RecipeOverviewScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
