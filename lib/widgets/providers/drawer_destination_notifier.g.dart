// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_destination_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(drawerDestinations)
final drawerDestinationsProvider = DrawerDestinationsProvider._();

final class DrawerDestinationsProvider
    extends
        $FunctionalProvider<
          List<List<DrawerDestination>>,
          List<List<DrawerDestination>>,
          List<List<DrawerDestination>>
        >
    with $Provider<List<List<DrawerDestination>>> {
  DrawerDestinationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'drawerDestinationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$drawerDestinationsHash();

  @$internal
  @override
  $ProviderElement<List<List<DrawerDestination>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<List<DrawerDestination>> create(Ref ref) {
    return drawerDestinations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<List<DrawerDestination>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<List<DrawerDestination>>>(
        value,
      ),
    );
  }
}

String _$drawerDestinationsHash() =>
    r'cd11f5cbf77bfb81adf2aa6893a16ddc31039674';
