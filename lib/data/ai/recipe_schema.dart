import 'dart:convert';

import 'package:schemantic/schemantic.dart';

abstract class RecipeSchema {
  static Map<String, dynamic> strictify(Map<String, dynamic> node) {
    const droppedKeywords = {r'$schema', 'nullable'};
    final out = <String, dynamic>{};

    for (final entry in node.entries) {
      if (droppedKeywords.contains(entry.key)) continue;
      final value = entry.value;

      if (entry.key == 'properties' && value is Map) {
        out['properties'] = <String, dynamic>{
          for (final property in value.entries)
            property.key as String: strictify(
              (property.value as Map).cast<String, dynamic>(),
            ),
        };
      } else if (entry.key == 'items' && value is Map) {
        out['items'] = strictify(value.cast<String, dynamic>());
      } else {
        out[entry.key] = value;
      }
    }

    if (node['nullable'] == true && out['type'] is String) {
      out['type'] = <String>[out['type'] as String, 'null'];
    }

    if (out['type'] == 'object' && out['properties'] is Map) {
      out['required'] = (out['properties'] as Map).keys.toList();
      out['additionalProperties'] = false;
    }

    return out;
  }

  static SchemanticType<Map<String, dynamic>> wrap(
    Map<String, dynamic> jsonSchema,
  ) => SchemanticType.from<Map<String, dynamic>>(
    jsonSchema: strictify(jsonSchema),
    parse: (json) => (json as Map).cast<String, dynamic>(),
  );

  static Map<String, dynamic> decode(String raw) =>
      jsonDecode(raw) as Map<String, dynamic>;
}
