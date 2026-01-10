import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

Color getRandomColorBasedOnString(String string) {
  // A simple hash function to convert the string to a hash code
  int hash = string.hashCode;

  // Ensure the minimum value for brightness
  int minBrightness = 128; // Adjust this value to ensure minimum brightness
  int range = 255 - minBrightness;

  // Generate color components from the hash
  int r = ((hash & 0xFF0000) >> 16) % range + minBrightness;
  int g = ((hash & 0x00FF00) >> 8) % range + minBrightness;
  int b = (hash & 0x0000FF) % range + minBrightness;

  return Color.fromARGB(255, r, g, b);
}

final dateFormat = DateFormat("dd.MM.yy");
final dateTimeFormat = DateFormat("dd.MM.yy HH:mm");
final timeFormat = DateFormat("HH:mm");

final emailRegex = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
);

const _windowsReserved = {
  'con',
  'prn',
  'aux',
  'nul',
  'com1',
  'com2',
  'com3',
  'com4',
  'lpt1',
  'lpt2',
  'lpt3',
};

String normalizeFileName(String input) {
  String name = input.trim().toLowerCase();
  name = name.replaceAll(RegExp(r'\s+'), '_');
  name = name.replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1F]'), '');
  name = name.replaceAll(RegExp(r'_+'), '_');
  name = _windowsReserved.contains(name) ? '${name}_file' : name;
  if (name.isEmpty) {
    return 'file';
  }

  return name;
}
