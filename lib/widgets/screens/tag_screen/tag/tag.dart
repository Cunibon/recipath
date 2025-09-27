import 'package:flutter/material.dart';
import 'package:recipath/helper/color_extension.dart';

class Tag extends StatelessWidget {
  const Tag({required this.text, required this.color, super.key});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.darken(0.25),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Stack(
          children: [
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: color.lighten(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}
