import 'package:dotted_border/dotted_border.dart';
import 'package:material_ui/material_ui.dart';

class NormedDottedBorder extends StatelessWidget {
  const NormedDottedBorder({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: ColorScheme.of(context).surfaceContainer,
        strokeWidth: 4,
        dashPattern: [8, 4],
        radius: Radius.circular(12),
        padding: EdgeInsets.all(8),
      ),
      child: child,
    );
  }
}
