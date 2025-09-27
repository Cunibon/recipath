// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullTagRepoNotifier)
const fullTagRepoProvider = FullTagRepoNotifierProvider._();

final class FullTagRepoNotifierProvider
    extends $FunctionalProvider<Repo<TagData>, Repo<TagData>, Repo<TagData>>
    with $Provider<Repo<TagData>> {
  const FullTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullTagRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo<TagData>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo<TagData> create(Ref ref) {
    return fullTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<TagData>>(value),
    );
  }
}

String _$fullTagRepoNotifierHash() =>
    r'e1671a5e034bb338bff9ed686de9d2dab22d2806';
