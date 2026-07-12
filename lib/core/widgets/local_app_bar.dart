import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class LocalAppBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onIconTap;
  const LocalAppBar({super.key, required this.title, this.icon, this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.textHintColor.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: AppColors.secondaryColor,
                size: 17.4,
              ),
            ),
          ),
          const Spacer(),
          Text(title,
              style: AppTextStyle.headline1
                  .copyWith(color: AppColors.secondaryColor, fontSize: 16)),
          const Spacer(),

          if (icon != null)
            GestureDetector(
              onTap: onIconTap,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.textHintColor.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppColors.errorIconColor,
                  size: 17.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
