import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const localKey = "localKey";

  @override
  Locale build() => Locale(
    localStorage.getItem(localKey) ?? Platform.localeName.split("_").first,
  );

  void set(String value) {
    localStorage.setItem(localKey, value);

    ref.invalidateSelf();
  }
}
