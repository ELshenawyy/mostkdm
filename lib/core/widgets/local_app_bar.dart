import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class LocalAppBar extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final bool isLight;

  const LocalAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onIconTap,
    this.isLight = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isLight ? AppColors.surface : AppColors.secondaryColor;
    final iconBgColor = isLight
        ? AppColors.surface.withValues(alpha: 0.15)
        : AppColors.textHintColor.withValues(alpha: 0.10);
    final iconColor = isLight ? AppColors.surface : AppColors.secondaryColor;

    return SafeArea(
      
        child: Row(
          children: [
            SizedBox(
              width: 34,
              height: 34,
              child: prefixIcon != null
                  ? GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          prefixIcon ?? Icons.arrow_back_ios,
                          color: iconColor,
                          size: 17.4,
                        ),
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.headline1.copyWith(
                  color: textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: 34,
              height: 34,
              child: icon != null
                  ? GestureDetector(
                      onTap: onIconTap,
                      child: Container(
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
                    )
                  : null,
            ),
          ],
        ),
      
    );
  }
}
