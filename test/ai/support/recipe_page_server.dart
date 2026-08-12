import 'dart:convert';
import 'dart:io';

class RecipePageServer {
  RecipePageServer._(this._server);

  final HttpServer _server;

  String get url => 'http://127.0.0.1:${_server.port}/recipe';

  static Future<RecipePageServer> serve(String plainTextRecipe) =>
      serveHtml(_asHtml(plainTextRecipe));

  static Future<RecipePageServer> serveHtml(String body) async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);

    server.listen((request) async {
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.html
        ..write(body);
      await request.response.close();
    });

    return RecipePageServer._(server);
  }

  Future<void> stop() => _server.close(force: true);

  static String _asHtml(String plainTextRecipe) {
    final escaped = const HtmlEscape().convert(plainTextRecipe);
    return '''
<!doctype html>
<html><head><title>Recipe</title>
<script>window.analytics = {track: function () {}};</script>
<style>body { font-family: sans-serif; }</style>
</head>
<body>
<nav>Home / Recipes</nav>
<article><pre>$escaped</pre></article>
<footer>Copyright</footer>
</body></html>
''';
  }
}
