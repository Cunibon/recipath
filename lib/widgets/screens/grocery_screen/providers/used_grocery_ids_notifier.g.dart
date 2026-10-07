// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'used_grocery_ids_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(usedGroceryIdsNotifier)
final usedGroceryIdsProvider = UsedGroceryIdsNotifierProvider._();

final class UsedGroceryIdsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ISet<String>>,
          ISet<String>,
          Stream<ISet<String>>
        >
    with $FutureModifier<ISet<String>>, $StreamProvider<ISet<String>> {
  UsedGroceryIdsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usedGroceryIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usedGroceryIdsNotifierHash();

  @$internal
  @override
  $StreamProviderElement<ISet<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ISet<String>> create(Ref ref) {
    return usedGroceryIdsNotifier(ref);
  }
}

String _$usedGroceryIdsNotifierHash() =>
    r'f667b66a091d2773ca497658527e1317092da60d';
