// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullTagRepoNotifier)
final fullTagRepoProvider = FullTagRepoNotifierProvider._();

final class FullTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<TagData>,
          LocalRepo<TagData>,
          LocalRepo<TagData>
        >
    with $Provider<LocalRepo<TagData>> {
  FullTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullTagRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<TagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<TagData> create(Ref ref) {
    return fullTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<TagData>>(value),
    );
  }
}

String _$fullTagRepoNotifierHash() =>
    r'21ba315fa298f06fd6ac95685b4e6a5b63a18995';
