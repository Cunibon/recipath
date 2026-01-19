import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    this.style,
    required this.endTime,
    this.onDone,
  });
  final DateTime endTime;
  final TextStyle? style;

  final void Function()? onDone;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with WidgetsBindingObserver {
  late Duration _elapsed;
  Timer? _timer;

  Duration get currentDiff => widget.endTime.difference(DateTime.now());

  @override
  void initState() {
    super.initState();
    _elapsed = currentDiff;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_elapsed.inSeconds <= 0) {
          if (widget.endTime.isBefore(DateTime.now())) {
            widget.onDone?.call();
          }
        } else {
          _elapsed -= const Duration(seconds: 1);
        }
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
    final seconds = max(
      duration.inSeconds.remainder(60),
      0,
    ).toString().padLeft(2, '0');
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
