// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TimerNotifier)
const timerProvider = TimerNotifierProvider._();

final class TimerNotifierProvider
    extends $NotifierProvider<TimerNotifier, Map<String, TimerData>> {
  const TimerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timerNotifierHash();

  @$internal
  @override
  TimerNotifier create() => TimerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, TimerData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, TimerData>>(value),
    );
  }
}

String _$timerNotifierHash() => r'68e8c62deda73a51e465a8aae662cb7b5413f9db';

abstract class _$TimerNotifier extends $Notifier<Map<String, TimerData>> {
  Map<String, TimerData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<Map<String, TimerData>, Map<String, TimerData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, TimerData>, Map<String, TimerData>>,
              Map<String, TimerData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
