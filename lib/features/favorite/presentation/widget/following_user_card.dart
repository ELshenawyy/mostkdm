import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class FollowingUserCard extends StatelessWidget {
  final String name;
  final int adsCount;
  final String? userImage;
  final VoidCallback? onUnfollow;

  const FollowingUserCard({
    super.key,
    required this.name,
    required this.adsCount,
    this.userImage,
    this.onUnfollow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
           backgroundImage: (userImage != null && userImage!.isNotEmpty)
                ? NetworkImage(userImage!) as ImageProvider
                : const AssetImage(AppImages.car),
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.25 * MediaQuery.of(context).size.width,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  name,
                  style: AppTextStyle.textFieldHeader,
                  maxLines: 1,
                ),
              ),
              Text('$adsCount إعلان',
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          AppButton(
            label: 'إلغاء المتابعة',
            onTap: onUnfollow,
            kind: AppButtonKind.outline,
            width: 168,
            height: 40,
            icon: Icons.remove,
          ),
        ],
      ),
    );
  }
}
