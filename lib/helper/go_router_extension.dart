import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouterRelative on BuildContext {
  void goRelative(
    String relativePath, {
    Map<String, String?>? queryParameters,
    Object? extra,
  }) {
    final state = GoRouterState.of(this);
    final basePath = state.uri.path;

    final uri = Uri(
      path: '$basePath/$relativePath',
      queryParameters: {
        ...state.uri.queryParameters,
        if (queryParameters != null) ...queryParameters,
      },
    );

    GoRouter.of(this).go(uri.toString(), extra: extra);
  }
}
