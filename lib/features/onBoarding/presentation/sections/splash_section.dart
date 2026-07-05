import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/onBoarding/presentation/widgets/feature_card.dart';

class SplashSection extends StatefulWidget {
  const SplashSection({super.key});

  @override
  State<SplashSection> createState() => _SplashSectionState();
}

class _SplashSectionState extends State<SplashSection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Image.asset(
        AppImages.logo,
        width: 209,
        height: 96,
      ),
      SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FeatureCard(icon: Icons.bolt_outlined, title: 'سرعة وأداء'),
          SizedBox(width: 8),
          FeatureCard(icon: Icons.shield_outlined, title: 'أمان موثوق'),
        ],
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FeatureCard(icon: Icons.star_outline, title: 'جودة عالية'),
          SizedBox(width: 8),
          FeatureCard(icon: Icons.trending_down, title: 'أفضل الأسعار'),
        ],
      ),
    ]);
  }
}
