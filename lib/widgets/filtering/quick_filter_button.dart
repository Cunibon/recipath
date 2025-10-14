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
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        filter.quickFilter.icon,
        color: filter.active ? Colors.amber : null,
        size: 28,
      ),
    );
  }
}
