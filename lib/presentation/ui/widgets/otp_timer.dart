import 'dart:async';

import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late int countdown;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    countdown = 120;

    // Create a periodic timer that runs every second
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        // Update the countdown
        countdown--;

        // Check if the countdown is complete
        if (countdown <= 0) {
          // Stop the timer when the countdown is complete
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Customize the UI as needed for your OTP timer display
    return Text(
      '$countdown s',
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
