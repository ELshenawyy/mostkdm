// otp_action_section.dart
import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';
import 'package:mostkdm/features/auth/presentation/widgets/app_resend_timer.dart';

class OtpActionsSection extends StatelessWidget {
  final bool isCompleted;
  const OtpActionsSection({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          label: 'تحقق',
          onTap: () {},
          kind: isCompleted ? AppButtonKind.secondary : AppButtonKind.ghost,
          icon: isCompleted ? null : Icons.shield_outlined,
          
        ),
        
        const SizedBox(height: 16),
        if (!isCompleted) ...[
          AppResendTimer(
            seconds: 55,
            onResend: () {},
          ),
          AppHintSection(title: "💡 قد تستغرق الرسالة بضع دقائق للوصول. تحقق من مجلد الرسائل غير المرغوب فيها",)
        ],
      ],
    );
  }
}
