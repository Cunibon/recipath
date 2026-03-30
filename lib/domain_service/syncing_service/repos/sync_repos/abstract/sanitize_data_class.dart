import 'package:drift/drift.dart';

extension SanitizeDataClass on DataClass {
  Map<String, dynamic> sanitizedJson() => _sanitizeJson(toJson());

  Map<String, dynamic> _sanitizeJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      if (value is double && (value.isNaN || value.isInfinite)) {
        return MapEntry(key, null);
      }
      if (value is Map<String, dynamic>) {
        return MapEntry(key, _sanitizeJson(value));
      }
      if (value is List) {
        return MapEntry(
          key,
          value
              .map((e) => e is Map<String, dynamic> ? _sanitizeJson(e) : e)
              .toList(),
        );
      }
      return MapEntry(key, value);
    });
  }
}
