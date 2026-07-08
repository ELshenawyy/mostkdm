import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class PremiumBadge extends StatelessWidget {
  const PremiumBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Color(0xFFFF9500),
            Color(0xFFFF6900),
          ],
          
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: AppColors.surface, size: 16),
          SizedBox(width: 4),
          Text(
            'مميز',
            style: AppTextStyle.headline2.copyWith(
                color: AppColors.surface, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
