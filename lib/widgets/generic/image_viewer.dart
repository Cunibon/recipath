import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black.withAlpha(180),
          body: Stack(
            children: [
              InteractiveViewer(
                clipBehavior: Clip.none,
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(child: child),
              ),
              Align(
                alignment: .topRight,
                child: SafeArea(
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
