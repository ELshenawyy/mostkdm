import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class LocalAppBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final bool isLight;
  const LocalAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onIconTap,  this.isLight = false,
  });

  @override
 Widget build(BuildContext context) {
    final textColor = isLight ? AppColors.surface : AppColors.secondaryColor;
    final iconBgColor = isLight
        ? AppColors.surface.withValues(alpha: 0.15)
        : AppColors.textHintColor.withValues(alpha: 0.10);
    final iconColor = isLight ? AppColors.surface : AppColors.secondaryColor;

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
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_outlined,
                color: iconColor,
                size: 17.4,
              ),
            ),
          ),
          const Spacer(),
          Text(title,
              style: AppTextStyle.headline1
                  .copyWith(color: textColor, fontSize: 16)),
          const Spacer(),
          if (icon != null)
            GestureDetector(
              onTap: onIconTap,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: iconBgColor,
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
