import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_provider.g.dart';

@riverpod
class DarkModeNotifier extends _$DarkModeNotifier {
  static const darkModeKey = "darkModeKey";

  @override
  bool build() {
    final systemDefault =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return localStorage.get<bool>(darkModeKey) ??
        systemDefault == Brightness.dark;
  }

  void set(bool darkMode) {
    localStorage.set(darkModeKey, darkMode);
    ref.invalidateSelf();
  }
}
