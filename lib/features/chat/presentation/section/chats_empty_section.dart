// features/chat/presentation/sections/chats_empty_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ChatsEmptySection extends StatelessWidget {
  const ChatsEmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 80,
                color: AppColors.primaryColor.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 16),
              Text('لا توجد رسائل', style: AppTextStyle.headline1),
              const SizedBox(height: 8),
              const Text(
                'لا يوجد لديك رسائل في صندوق الدردشة الآن',
                textAlign: TextAlign.center,
                style: AppTextStyle.headline2),
              
            ],
          ),
        ),
      ),
    );
  }
}