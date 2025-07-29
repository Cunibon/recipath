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

final doubleNumberFormat = NumberFormat()..maximumFractionDigits = 2;

final dateFormat = DateFormat("dd.MM.yy");
final dateTimeFormat = DateFormat("dd.MM.yy HH:mm");
