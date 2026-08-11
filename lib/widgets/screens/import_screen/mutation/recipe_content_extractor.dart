import 'dart:convert';

import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;

abstract class RecipeContentExtractor {
  static final _jsonLdPattern = RegExp(
    r'<script[^>]*type\s*=\s*["\x27]application/ld\+json["\x27][^>]*>([\s\S]*?)</script>',
    caseSensitive: false,
  );

  /// Fetches a URL and tries to extract JSON-LD Recipe data.
  /// Falls back to plain webpage text if no structured data is found.
  static Future<String> extract(String url) async {
    final response = await http.get(Uri.parse(url));
    final html = utf8.decode(response.bodyBytes, allowMalformed: true);

    final recipeJsonLd = _tryExtractRecipeJsonLd(html);
    if (recipeJsonLd != null) {
      return 'Structured recipe data (JSON-LD):\n\n$recipeJsonLd';
    }

    final body = html_parser.parse(html).body;
    if (body == null) return '';

    for (final element in body.querySelectorAll(
      'script, style, noscript, template, svg',
    )) {
      element.remove();
    }

    return body.text
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .join('\n');
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
