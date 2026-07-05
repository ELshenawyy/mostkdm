
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class OtpHintSection extends StatelessWidget {
  const OtpHintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Flexible(
            child: Text(
              'قد تستغرق الرسالة بضع دقائق للوصول، تحقق من مجلد الرسائل غير المرغوب فيها',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.secondaryColor),
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.info_outline,
              size: 16, color: AppColors.primaryColor.withValues(alpha: 0.8)),
        ],
      ),
    );
  }
}