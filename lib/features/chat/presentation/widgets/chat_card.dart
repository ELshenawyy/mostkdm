// features/chat/presentation/widgets/chat_card.dart

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
    this.unreadCount = 5,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              userImage ?? AppImages.car,
                              width: 48,
                              height: 48,
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
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(name,
                                    style: AppTextStyle.buttonText.copyWith(
                                        color: AppColors.secondaryColor)),
                                Spacer(),
                                Text(time, style: AppTextStyle.textFieldHeader),
                                const SizedBox(width: 4),
                                Icon(Icons.done_all,
                                    size: 14,
                                    color: isRead
                                        ? AppColors.primaryColor
                                        : Colors.grey),
                                const SizedBox(height: 4),
                              ],
                            ),
                            const SizedBox(height: 4),
                            if (adTitle != null)
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      adImage ?? AppImages.carAdd,
                                      width: 48,
                                      height: 48,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(adTitle!,
                                        style: AppTextStyle.textFieldHeader
                                            .copyWith(
                                                color: AppColors.primaryColor)),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 4),
                            Text(
                              lastMessage,
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textFieldLabel
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
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
