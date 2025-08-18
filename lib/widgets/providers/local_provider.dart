import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_provider.g.dart';

@riverpod
class LocalNotifier extends _$LocalNotifier {
  static const localKey = "localKey";

  @override
  Locale build() =>
      Locale(localStorage.getItem(localKey) ?? Platform.localeName);

  void set(String value) {
    localStorage.setItem(localKey, value);

    ref.invalidateSelf();
  }
}
