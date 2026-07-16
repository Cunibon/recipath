import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

const phoneDesignCanvas = Size(576, 1024);

enum MarketingTarget {
  android(
    platform: TargetPlatform.android,
    resolution: Size(2160, 3840),
    pixelRatio: 3.75,
    goldenSubFolder: 'phoneScreenshots/',
  ),
  iphone(
    platform: TargetPlatform.iOS,
    resolution: Size(1284, 2778),
    pixelRatio: 3,
    goldenSubFolder: 'iphoneScreenshots/',
  ),
  ipad(
    platform: TargetPlatform.iOS,
    resolution: Size(2064, 2752),
    pixelRatio: 2,
    goldenSubFolder: 'ipadScreenshots/',
  );

  const MarketingTarget({
    required this.platform,
    required this.resolution,
    required this.pixelRatio,
    required this.goldenSubFolder,
  });

  final TargetPlatform platform;
  final Size resolution;
  final double pixelRatio;
  final String goldenSubFolder;

  PhoneStatusBar get statusBar => switch (this) {
    android => PhoneStatusBar.android,
    iphone || ipad => PhoneStatusBar.ios,
  };

  ScreenshotDevice device(String title) => ScreenshotDevice(
    platform: platform,
    resolution: resolution,
    pixelRatio: pixelRatio,
    goldenSubFolder: goldenSubFolder,
    frameBuilder:
        ({
          required ScreenshotDevice device,
          required ScreenshotFrameColors? frameColors,
          required Widget child,
        }) => switch (this) {
          android || iphone => MarketingFrame(
            title: title,
            statusBar: statusBar,
            child: child,
          ),
          ipad => TabletMarketingFrame(title: title, child: child),
        },
  );
}

enum PhoneStatusBar { android, ios }

class MarketingFrame extends StatelessWidget {
  const MarketingFrame({
    super.key,
    required this.title,
    required this.statusBar,
    required this.child,
  });

  final String title;
  final PhoneStatusBar statusBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CoverCanvas(
      child: MarketingBackdrop(
        title: title,
        children: [
          Positioned(
            bottom: -139,
            left: 0,
            right: 0,
            child: Center(child: PhoneFrame(statusBar: statusBar, child: child)),
          ),
        ],
      ),
    );
  }
}

class TabletMarketingFrame extends StatelessWidget {
  const TabletMarketingFrame({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MarketingBackdrop(
      title: title.replaceAll('\n', ' '),
      titleFontSize: 92,
      titleTop: 56,
      children: [
        Positioned(
          bottom: -80,
          left: 0,
          right: 0,
          child: Center(child: TabletFrame(child: child)),
        ),
      ],
    );
  }
}

class CoverCanvas extends StatelessWidget {
  const CoverCanvas({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      clipBehavior: Clip.hardEdge,
      child: SizedBox.fromSize(size: phoneDesignCanvas, child: child),
    );
  }
}

class MarketingBackdrop extends StatelessWidget {
  const MarketingBackdrop({
    super.key,
    required this.title,
    this.titleFontSize = 64,
    this.titleTop = 44,
    required this.children,
  });

  final String title;
  final double titleFontSize;
  final double titleTop;
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
              top: titleTop,
              left: 16,
              right: 16,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFE6E0E9),
                  fontFamily: 'Roboto',
                  fontSize: titleFontSize,
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
  const PhoneFrame({super.key, required this.statusBar, required this.child});

  static const screenSize = Size(392.3, 830);
  static const bezel = 14.0;
  static const screenRadius = 30.0;

  final PhoneStatusBar statusBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(right: -2.5, top: 140, child: _SideButton(height: 88)),
        Positioned(right: -2.5, top: 248, child: _SideButton(height: 48)),
        _DeviceShell(
          screenSize: screenSize,
          bezel: bezel,
          screenRadius: screenRadius,
          child: Stack(
            children: [
              switch (statusBar) {
                PhoneStatusBar.android => ScreenshotFrame.androidPhone(
                  device: GoldenScreenshotDevices.androidPhone.device,
                  child: child,
                ),
                PhoneStatusBar.ios => ScreenshotFrame.iphone(
                  device: GoldenScreenshotDevices.iphone.device,
                  child: child,
                ),
              },
              switch (statusBar) {
                PhoneStatusBar.android => const _PunchHoleCamera(),
                PhoneStatusBar.ios => const _DynamicIsland(),
              },
            ],
          ),
        ),
      ],
    );
  }
}

class TabletFrame extends StatelessWidget {
  const TabletFrame({super.key, required this.child});

  static const screenSize = Size(800, 1067);
  static const bezel = 26.0;
  static const screenRadius = 24.0;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _DeviceShell(
      screenSize: screenSize,
      bezel: bezel,
      screenRadius: screenRadius,
      child: ScreenshotFrame.ipad(
        device: GoldenScreenshotDevices.ipad.device,
        child: child,
      ),
    );
  }
}

class _DeviceShell extends StatelessWidget {
  const _DeviceShell({
    required this.screenSize,
    required this.bezel,
    required this.screenRadius,
    required this.child,
  });

  final Size screenSize;
  final double bezel;
  final double screenRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
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
      padding: EdgeInsets.all(bezel),
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
            child: child,
          ),
        ),
      ),
    );
  }
}

class _PunchHoleCamera extends StatelessWidget {
  const _PunchHoleCamera();

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class _DynamicIsland extends StatelessWidget {
  const _DynamicIsland();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 110,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF050505),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
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
    required this.statusBar,
    required this.back,
    required this.front,
  });

  final String title;
  final PhoneStatusBar statusBar;
  final Widget back;
  final Widget front;

  @override
  Widget build(BuildContext context) {
    return CoverCanvas(
      child: MarketingBackdrop(
        title: title,
        children: [
          Positioned(
            left: -98,
            bottom: -97,
            child: Transform.rotate(
              angle: -18 * pi / 180,
              child: PhoneFrame(statusBar: statusBar, child: back),
            ),
          ),
          Positioned(
            right: -58.3,
            bottom: -187,
            child: Transform.rotate(
              angle: 8.5 * pi / 180,
              child: PhoneFrame(statusBar: statusBar, child: front),
            ),
          ),
        ],
      ),
    );
  }
}
