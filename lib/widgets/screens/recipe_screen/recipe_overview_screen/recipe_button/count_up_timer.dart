import 'dart:async';

import 'package:flutter/material.dart';

class CountUpTimer extends StatefulWidget {
  const CountUpTimer({super.key, this.style, required this.startTime});
  final DateTime startTime;
  final TextStyle? style;

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer>
    with WidgetsBindingObserver {
  late Duration _elapsed;
  Timer? _timer;

  Duration get currentDiff => DateTime.now().difference(widget.startTime);

  @override
  void initState() {
    super.initState();
    _elapsed = currentDiff;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _elapsed += const Duration(seconds: 1);
      });
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _elapsed = currentDiff;
      });
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_elapsed),
      style:
          widget.style ?? TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
