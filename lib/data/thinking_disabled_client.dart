import 'dart:convert';

import 'package:http/http.dart' as http;

class ThinkingDisabledClient extends http.BaseClient {
  ThinkingDisabledClient();

  final _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (request.method != 'post') {
      return _inner.send(request);
    }

    final bodyBytes = await request.finalize().toBytes();

    try {
      final json = jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>;
      json['thinking'] = {'type': 'disabled'};
      final newBody = utf8.encode(jsonEncode(json));

      final newRequest = http.Request(request.method, request.url);
      newRequest.bodyBytes = newBody;
      newRequest.headers.addAll(request.headers);
      newRequest.headers['Content-Length'] = newBody.length.toString();

      return _inner.send(newRequest);
    } catch (_) {
      final newRequest = http.Request(request.method, request.url);
      newRequest.bodyBytes = bodyBytes;
      newRequest.headers.addAll(request.headers);
      return _inner.send(newRequest);
    }
  }
}
