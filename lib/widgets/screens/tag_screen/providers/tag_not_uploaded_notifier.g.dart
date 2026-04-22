// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagNotUploadedNotifier)
final tagNotUploadedProvider = TagNotUploadedNotifierProvider._();

final class TagNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  TagNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return tagNotUploadedNotifier(ref);
  }
}

String _$tagNotUploadedNotifierHash() =>
    r'aae2b3a97cf174eed996d1c2ab4327773aa0ccf7';
