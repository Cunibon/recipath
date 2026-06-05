import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class SentryProviderObserver extends ProviderObserver {
  const SentryProviderObserver();

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    if (error is ProviderException) return;

    final provider = context.provider;
    final family = provider.from;
    final argument = provider.argument;
    final mutation = context.mutation;

    Sentry.captureException(
      error,
      stackTrace: stackTrace,
      withScope: (scope) => scope.setContexts('riverpod_info', {
        'provider': provider.name ?? provider.runtimeType.toString(),
        if (family != null)
          'providerFamily': family.name ?? family.runtimeType.toString(),
        if (argument != null)
          'providerArgumentType': argument.runtimeType.toString(),
        'providerAutoDispose': provider.isAutoDispose,
        if (mutation != null)
          'pendingMutationType': mutation.runtimeType.toString(),
      }),
    );
  }
}
