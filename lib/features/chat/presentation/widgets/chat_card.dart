import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ChatCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String? userImage;
  final String? adImage;
  final bool isRead;
  final String? adTitle;
  final VoidCallback? onTap;
  final int unreadCount;

  const ChatCard({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.userImage,
    this.isRead = true,
    this.adTitle,
    this.onTap,
    this.adImage,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          children: [
            // 1. صورة المستخدم ومعرف الرسائل الغير مقروءة
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: userImage != null && userImage!.isNotEmpty
                      ? Image.network(
                          userImage!,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.asset(
                            AppImages.car,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          AppImages.car,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                ),
                if (unreadCount > 0)
                  Positioned(
                    top: -5,
                    left: -5,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$unreadCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),

            // 2. تفاصيل المحادثة الإجمالية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الاسم + الوقت + حالة القراءة
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.buttonText.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: AppTextStyle.textFieldHeader,
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.done_all,
                        size: 14,
                        color: isRead ? AppColors.primaryColor : Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // عنوان الإعلان والـ Tag الخاص به
                  if (adTitle != null && adTitle!.isNotEmpty) ...[
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: adImage != null && adImage!.isNotEmpty
                              ? Image.network(
                                  adImage!,
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Image.asset(
                                    AppImages.carAdd,
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  AppImages.carAdd,
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              adTitle!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textFieldHeader.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                  ],

                  // آخر رسالة (مفصولة تحت عنوان الإعلان لضمان عدم حدوث Overflow)
                  Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textFieldLabel.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}