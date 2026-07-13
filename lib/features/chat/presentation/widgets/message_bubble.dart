import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;

  const MessageBubble({
    super.key,
    required this.message,
    required this.time,
    this.isSender = false,
  });

  Widget _avatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        AppImages.car,
        width: 36,
        height: 36,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bubble(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSender ? AppColors.surface : AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isSender ? Radius.zero : const Radius.circular(12),
          bottomRight: isSender ? const Radius.circular(12) : Radius.zero,
        ),
        border: isSender
            ? Border.all(color: AppColors.primaryColor.withValues(alpha: 0.1))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: TextStyle(
              color: isSender ? AppColors.secondaryColor : AppColors.surface,
              fontSize: 13,
            ),
          ),
          Text(
            time,
            style: TextStyle(
                fontSize: 10,
                color: isSender ? AppColors.secondaryColor : AppColors.surface),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: isSender
                ? [
                    _bubble(context),
                    const SizedBox(width: 8),
                    _avatar(),
                  ]
                : [
                    _avatar(),
                    const SizedBox(width: 8),
                    _bubble(context),
                  ],
          ),
        ],
      ),
    );
  }
}
