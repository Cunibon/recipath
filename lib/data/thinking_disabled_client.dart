import 'dart:convert';

import 'package:http/http.dart' as http;

class ThinkingDisabledClient extends http.BaseClient {
  ThinkingDisabledClient({http.Client? inner}) : _inner = inner ?? http.Client();

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (request.method.toUpperCase() != 'POST' ||
        !request.url.path.endsWith('/chat/completions')) {
      return _inner.send(request);
    }

    final bytes = await request.finalize().toBytes();
    var body = bytes;

    try {
      final json = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
      json['thinking'] = const {'type': 'disabled'};
      body = utf8.encode(jsonEncode(json));
    } catch (_) {
      body = bytes;
    }

    final rebuilt = http.Request(request.method, request.url)
      ..bodyBytes = body
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..persistentConnection = request.persistentConnection;
    rebuilt.headers.addAll(request.headers);
    rebuilt.headers['Content-Length'] = body.length.toString();

    return _inner.send(rebuilt);
  }

  @override
  void close() => _inner.close();
}
