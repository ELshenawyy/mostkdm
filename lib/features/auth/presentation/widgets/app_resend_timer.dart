// core/widgets/app_resend_timer.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AppResendTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;

  const AppResendTimer({
    super.key,
    this.seconds = 55,
    required this.onResend,
  });

  @override
  State<AppResendTimer> createState() => _AppResendTimerState();
}

class _AppResendTimerState extends State<AppResendTimer> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remaining == 0) {
        t.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  void _onResendTap() {
    setState(() => _remaining = widget.seconds);
    _startTimer();
    widget.onResend();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _remaining > 0
        ? RichText(
            text: TextSpan(
              text: 'إعادة إرسال الرمز بعد ',
              style: const TextStyle(
                color: AppColors.textHintColor,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '$_remaining',
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' ثانية',
                  style: const TextStyle(
                    color: AppColors.textHintColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: _onResendTap,
            child: const Text(
              'إعادة إرسال الرمز',
              style: TextStyle(
                color: AppColors.secondaryBtnText,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          );
  }
}
