// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_grocery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredGroceryNotifier)
final filteredGroceryProvider = FilteredGroceryNotifierFamily._();

final class FilteredGroceryNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, GroceryData>>,
          IMap<String, GroceryData>,
          Stream<IMap<String, GroceryData>>
        >
    with
        $FutureModifier<IMap<String, GroceryData>>,
        $StreamProvider<IMap<String, GroceryData>> {
  FilteredGroceryNotifierProvider._({
    required FilteredGroceryNotifierFamily super.from,
    required FilterTypeEnum super.argument,
  }) : super(
         retry: null,
         name: r'filteredGroceryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredGroceryNotifierHash();

  @override
  String toString() {
    return r'filteredGroceryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<IMap<String, GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, GroceryData>> create(Ref ref) {
    final argument = this.argument as FilterTypeEnum;
    return filteredGroceryNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredGroceryNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredGroceryNotifierHash() =>
    r'c7f2517d31b83b97af70e900e90c7a67ec2ba1c7';

final class FilteredGroceryNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<IMap<String, GroceryData>>,
          FilterTypeEnum
        > {
  FilteredGroceryNotifierFamily._()
    : super(
        retry: null,
        name: r'filteredGroceryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredGroceryNotifierProvider call(FilterTypeEnum filterType) =>
      FilteredGroceryNotifierProvider._(argument: filterType, from: this);

  @override
  String toString() => r'filteredGroceryProvider';
}
