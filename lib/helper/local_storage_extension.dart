import 'dart:convert';

import 'package:localstorage/localstorage.dart';

extension TypedStorage on LocalStorage {
  T? get<T>(String key) {
    final item = getItem(key);
    if (item is String) {
      return jsonDecode(item);
    }
    return null;
  }

  void setDynamic(String key, dynamic value) => setItem(key, jsonEncode(value));
}
