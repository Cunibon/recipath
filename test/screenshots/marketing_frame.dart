import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

const marketingResolution = Size(2160, 3840);
const marketingPixelRatio = 3.75;

ScreenshotDevice marketingDevice(String title) => ScreenshotDevice(
  platform: TargetPlatform.android,
  resolution: marketingResolution,
  pixelRatio: marketingPixelRatio,
  goldenSubFolder: 'phoneScreenshots/',
  frameBuilder:
      ({
        required ScreenshotDevice device,
        required ScreenshotFrameColors? frameColors,
        required Widget child,
      }) => MarketingFrame(device: device, title: title, child: child),
);

class MarketingFrame extends StatelessWidget {
  const MarketingFrame({
    super.key,
    required this.device,
    required this.title,
    required this.child,
  });

  final ScreenshotDevice device;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MarketingBackdrop(
      title: title,
      children: [
        Positioned(
          bottom: -139,
          left: 0,
          right: 0,
          child: Center(child: PhoneFrame(child: child)),
        ),
      ],
    );
  }
}

class MarketingBackdrop extends StatelessWidget {
  const MarketingBackdrop({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF49148B), Color(0xFF360E69)],
                ),
              ),
            ),
            Positioned(
              top: 44,
              left: 16,
              right: 16,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFE6E0E9),
                  fontFamily: 'Roboto',
                  fontSize: 64,
                  height: 1.17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key, required this.child});

  static const screenSize = Size(392.3, 830);
  static const bezel = 14.0;
  static const screenRadius = 30.0;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(right: -2.5, top: 140, child: _SideButton(height: 88)),
        Positioned(right: -2.5, top: 248, child: _SideButton(height: 48)),
        Container(
          width: screenSize.width + bezel * 2,
          height: screenSize.height + bezel * 2,
          decoration: BoxDecoration(
            color: const Color(0xFF17181A),
            borderRadius: BorderRadius.circular(screenRadius + bezel),
            border: Border.all(color: const Color(0xFF3E3F42), width: 1.4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 30,
                offset: const Offset(-8, 14),
              ),
            ],
          ),
          padding: const EdgeInsets.all(bezel),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenRadius),
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: MediaQuery(
                data: mediaQuery.copyWith(
                  size: screenSize,
                  padding: EdgeInsets.zero,
                  viewPadding: EdgeInsets.zero,
                  viewInsets: EdgeInsets.zero,
                ),
                child: Stack(
                  children: [
                    ScreenshotFrame.androidPhone(
                      device: GoldenScreenshotDevices.androidPhone.device,
                      child: child,
                    ),
                    Positioned(
                      top: 14,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF050505),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3B3D),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class DualPhoneShot extends StatelessWidget {
  const DualPhoneShot({
    super.key,
    required this.title,
    required this.back,
    required this.front,
  });

  final String title;
  final Widget back;
  final Widget front;

  @override
  Widget build(BuildContext context) {
    return MarketingBackdrop(
      title: title,
      children: [
        Positioned(
          left: -98,
          bottom: -97,
          child: Transform.rotate(
            angle: -18 * pi / 180,
            child: PhoneFrame(child: back),
          ),
        ),
        Positioned(
          right: -58.3,
          bottom: -187,
          child: Transform.rotate(
            angle: 8.5 * pi / 180,
            child: PhoneFrame(child: front),
          ),
        ),
      ],
    );
  }
}
