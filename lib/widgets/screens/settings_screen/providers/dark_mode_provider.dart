import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_provider.g.dart';

@riverpod
class DarkModeProvider extends _$DarkModeProvider {
  static const darkmodeKey = "darkmodeKey";

  @override
  bool build() {
    final systemDefault =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return localStorage.getBool(darkmodeKey) ??
        systemDefault == Brightness.dark;
  }

  void set(bool darkMode) {
    localStorage.setDynamic(darkmodeKey, darkMode);
    ref.invalidateSelf();
  }
}
