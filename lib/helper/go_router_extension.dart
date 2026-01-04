import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouterRelative on BuildContext {
  void goRelative(
    String relativePath, {
    Map<String, String?>? queryParameters,
  }) {
    final state = GoRouterState.of(this);
    final basePath = state.uri.path;

    String newPath;

    if (relativePath.startsWith('./')) {
      newPath = '$basePath/${relativePath.substring(2)}';
    } else if (relativePath.startsWith('../')) {
      final segments = basePath.split('/')..removeLast();
      final relativeSegments = relativePath.split('/');

      for (final seg in relativeSegments) {
        if (seg == '..') {
          segments.removeLast();
        } else if (seg != '.') {
          segments.add(seg);
        }
      }

      newPath = segments.join('/');
    } else {
      newPath = relativePath;
    }

    final uri = Uri(
      path: newPath,
      queryParameters: {
        ...state.uri.queryParameters,
        if (queryParameters != null) ...queryParameters,
      },
    );

    GoRouter.of(this).go(uri.toString());
  }
}
