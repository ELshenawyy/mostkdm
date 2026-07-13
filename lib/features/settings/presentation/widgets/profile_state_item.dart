import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ProfileStatItem extends StatelessWidget {
  final String count;
  final String label;
  final IconData icon;

  const ProfileStatItem({
    super.key,
    required this.count,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 108,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 24),
          const SizedBox(height: 4),
          Text(
            count,
            style: AppTextStyle.headline3,
          ),
          const SizedBox(height: 2),
          Text(label,
              style: AppTextStyle.textFieldHeader.copyWith(fontSize: 9)),
        ],
      ),
    );
  }
}
