// otp_action_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';
import 'package:mostkdm/features/auth/presentation/widgets/app_resend_timer.dart';

class OtpActionsSection extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback? onVerify;
  final String phone;
  final bool isForgetPassword;
  const OtpActionsSection(
      {super.key,
      required this.isCompleted,
      this.onVerify,
      required this.phone,
      this.isForgetPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          label: 'تحقق',
          onTap: isCompleted ? onVerify : null,
          kind: isCompleted ? AppButtonKind.secondary : AppButtonKind.ghost,
          icon: isCompleted ? null : Icons.shield_outlined,
        ),
        const SizedBox(height: 16),
        if (!isCompleted) ...[
          AppResendTimer(
            seconds: 55,
            onResend: () {
               context.read<AuthBloc>().add(
                ResendOtpEvent(phone: phone),
              );
            },
          ),
          AppHintSection(
            title:
                "💡 قد تستغرق الرسالة بضع دقائق للوصول. تحقق من مجلد الرسائل غير المرغوب فيها",
          )
        ],
      ],
    );
  }
}
