import 'package:flutter/material.dart';

class DrawerDestination {
  const DrawerDestination({
    required this.label,
    required this.route,
    required this.icon,
    this.secondary = false,
  });

  final String label;
  final String route;
  final IconData icon;
  final bool secondary;
}
