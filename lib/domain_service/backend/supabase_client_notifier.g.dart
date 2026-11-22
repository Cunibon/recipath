// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_client_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseClientNotifier)
final supabaseClientProvider = SupabaseClientNotifierProvider._();

final class SupabaseClientNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<SupabaseClient?>,
          SupabaseClient?,
          FutureOr<SupabaseClient?>
        >
    with $FutureModifier<SupabaseClient?>, $FutureProvider<SupabaseClient?> {
  SupabaseClientNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseClientNotifierHash();

  @$internal
  @override
  $FutureProviderElement<SupabaseClient?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SupabaseClient?> create(Ref ref) {
    return supabaseClientNotifier(ref);
  }
}

String _$supabaseClientNotifierHash() =>
    r'90bce299327d3b4f29c603b896f3625f25288002';
