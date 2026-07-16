import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class PolicyView extends StatelessWidget {
  final String title;
  final String content;
  final String icon;

  const PolicyView({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 120,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(
                      title: title,
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Image.asset(
                        icon,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: 25,
                        height: 4,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(height: 12),
                      Text(
                        title,
                        textAlign: TextAlign.right,
                        style: AppTextStyle.textFieldHeader,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        content,
                        textAlign: TextAlign.right,
                        style: AppTextStyle.textFieldHeader,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
