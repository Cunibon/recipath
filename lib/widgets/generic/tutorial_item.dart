import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/providers/tutorial/tutorial_items_notifier.dart';
import 'package:recipath/widgets/providers/tutorial/tutorial_notifier.dart';
import 'package:showcaseview/showcaseview.dart';

class TutorialItem extends ConsumerStatefulWidget {
  const TutorialItem({
    super.key,
    required this.identifier,
    required this.description,
    this.onTargetClick,
    required this.child,
  });

  final String identifier;
  final String description;

  final void Function()? onTargetClick;
  final Widget child;

  @override
  ConsumerState<TutorialItem> createState() => _TutorialItemState();
}

class _TutorialItemState extends ConsumerState<TutorialItem> {
  final itemKey = GlobalKey();
  late bool relevant;

  @override
  void initState() {
    super.initState();

    relevant = !ref.read(tutorialNotifierProvider).contains(widget.identifier);
    if (relevant) {
      ref.read(tutorialItemsNotifierProvider(widget.identifier)).add(itemKey);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_ref_inside_state_dispose
    ref.read(tutorialItemsNotifierProvider(widget.identifier)).remove(itemKey);
  }

  @override
  Widget build(BuildContext context) {
    return relevant
        ? Showcase(
            key: itemKey,
            description: widget.description,
            disableBarrierInteraction: true,
            disposeOnTap: true,
            onTargetClick: widget.onTargetClick,
            child: widget.child,
          )
        : widget.child;
  }
}
