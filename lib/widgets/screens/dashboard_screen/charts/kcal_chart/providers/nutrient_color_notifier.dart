import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutrient_color_notifier.g.dart';

@riverpod
Map<String, Color> nutrimentColorNotifier(Ref ref) => {
  'kcal': Colors.purple,
  'fat': Colors.orange,
  'carbs': Colors.brown,
  'protein': Colors.grey,
  'fiber': Colors.green,
};
