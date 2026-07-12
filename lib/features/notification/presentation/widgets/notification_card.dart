import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/AppConfirmBottomSheet.dart';
class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final String? userImage;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isRead = false,
    this.userImage,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart, 
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Icon(Icons.delete_outline, color: AppColors.errorIconColor, size: 24),
      ),
      confirmDismiss: (_) async {
        bool confirmed = false;
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              AppConfirmBottomSheet(
                title: 'حذف الإشعار',
                subtitle: 'هل أنت متأكد من أنك تريد حذف هذا الإشعار',
                confirmLabel: 'حذف',
                onConfirm: () => confirmed = true,
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                  ),
                  child: const Icon(Icons.notifications_off_outlined,
                      color: Colors.red, size: 24),
                ),
              ),
            ],
          ),
        );
        return confirmed;
      },
      onDismissed: (_) => onDelete?.call(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (!isRead)
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                            ),
                          ),
                        const SizedBox(width: 5),
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: userImage != null
                              ? AssetImage(userImage!)
                              : null,
                          child: userImage == null
                              ? const Icon(Icons.person_outline)
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style:
                                    AppTextStyle.headline3.copyWith(fontSize: 14)),
                            Text(subtitle,
                                style: AppTextStyle.textFieldHeader),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: AppTextStyle.textFieldLabel.copyWith(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}