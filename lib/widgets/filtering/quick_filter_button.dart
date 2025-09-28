import 'package:flutter/material.dart';
import 'package:recipath/widgets/filtering/quick_filter_data.dart';

class QuickFilterButton extends StatelessWidget {
  const QuickFilterButton({
    required this.filter,
    required this.onTap,
    super.key,
  });
  final QuickFilterData filter;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(
          filter.quickFilter.icon,
          color: filter.active ? Colors.amber : null,
          size: 28,
        ),
      ),
    );
  }
}
