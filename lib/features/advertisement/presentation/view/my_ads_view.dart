import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import '../section/my_ads_list_section.dart';

class MyAdsView extends StatelessWidget {
  const MyAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 160,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryHintColorWithOpacity,
                        shape: BoxShape.circle,
                      ),
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.arrow_back_ios,
                          color: AppColors.surface, size: 20),
                    ),
                    const Spacer(),
                    Text(
                      'إعلاناتى',
                      style: AppTextStyle.textBannerHeadline1,
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            Transform.translate(
              offset: const Offset(0, -80),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const MyAdsListSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
