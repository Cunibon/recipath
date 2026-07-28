import 'package:flutter/material.dart';

class AverageTimeText extends StatelessWidget {
  const AverageTimeText({required this.duration, super.key});

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Text("(Ø ${duration.inMinutes.toString()}min)");
  }
}
