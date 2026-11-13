import 'dart:convert';

import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;

abstract class RecipeContentExtractor {
  static final _jsonLdPattern = RegExp(
    r'<script[^>]*type\s*=\s*["\x27]application/ld\+json["\x27][^>]*>([\s\S]*?)</script>',
    caseSensitive: false,
  );
  static const _timeout = Duration(seconds: 20);
  static const _maxTextLength = 50000;
  static const _headers = {
    'User-Agent':
        'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) '
        'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 '
        'Mobile/15E148 Safari/604.1',
    'Accept': 'text/html,application/xhtml+xml,*/*;q=0.8',
  };

  /// Fetches a URL and tries to extract JSON-LD Recipe data.
  /// Falls back to plain webpage text if no structured data is found.
  static Future<String> extract(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: _headers).timeout(_timeout);
    if (response.statusCode >= 400) {
      throw http.ClientException('HTTP ${response.statusCode}', uri);
    }
    final html = utf8.decode(response.bodyBytes, allowMalformed: true);

    final recipeJsonLd = _tryExtractRecipeJsonLd(html);
    if (recipeJsonLd != null) {
      return 'Structured recipe data (JSON-LD):\n\n$recipeJsonLd';
    }

    final body = html_parser.parse(html).body;
    if (body == null) {
      throw http.ClientException('No readable content', uri);
    }

    for (final element in body.querySelectorAll(
      'script, style, noscript, template, svg',
    )) {
      element.remove();
    }

    final text = body.text
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .join('\n');
    if (text.isEmpty) {
      throw http.ClientException('No readable content', uri);
    }

    return text.length > _maxTextLength
        ? text.substring(0, _maxTextLength)
        : text;
  }

  /// Searches HTML for JSON-LD blocks containing a Recipe schema.
  static String? _tryExtractRecipeJsonLd(String html) {
    for (final match in _jsonLdPattern.allMatches(html)) {
      final jsonStr = match.group(1)?.trim();
      if (jsonStr == null || jsonStr.isEmpty) continue;

      try {
        final decoded = jsonDecode(jsonStr);
        final recipe = _findRecipeInJsonLd(decoded);
        if (recipe != null) return jsonEncode(recipe);
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  /// Recursively searches JSON-LD data for a Recipe @type.
  static Map<String, dynamic>? _findRecipeInJsonLd(dynamic data) {
    if (data is Map<String, dynamic>) {
      final type = data['@type'];
      if (type == 'Recipe' || (type is List && type.contains('Recipe'))) {
        return data;
      }
      // Check @graph arrays
      final graph = data['@graph'];
      if (graph is List) return _findRecipeInJsonLd(graph);
    }
    if (data is List) {
      for (final item in data) {
        final result = _findRecipeInJsonLd(item);
        if (result != null) return result;
      }
    }
    return null;
  }
}
