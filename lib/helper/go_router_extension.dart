import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension ContextGoRelative on BuildContext {
  void goRelative(
    String relativePath, {
    Map<String, String?>? queryParameters,
    Object? extra,
  }) => GoRouter.of(
    this,
  ).goRelative(relativePath, queryParameters: queryParameters, extra: extra);
}

extension GoRouterRelative on GoRouter {
  void goRelative(
    String relativePath, {
    Map<String, String?>? queryParameters,
    Object? extra,
  }) {
    final basePath = state.uri.path;

    final uri = Uri(
      path: '$basePath/$relativePath',
      queryParameters: queryParameters,
    );

    go(uri.toString(), extra: extra);
  }
}
