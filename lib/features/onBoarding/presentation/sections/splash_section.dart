import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/onBoarding/presentation/widgets/feature_card.dart';

class SplashSection extends StatefulWidget {
  const SplashSection({super.key});

  @override
  State<SplashSection> createState() => _SplashSectionState();
}

class _SplashSectionState extends State<SplashSection> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) context.go(RouteNames.chooseAccess);
    });
  }

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
          FeatureCard(icon: Icons.shield_outlined, title: 'أمان موثوق'),
          SizedBox(width: 8),
          FeatureCard(icon: Icons.bolt_outlined, title: 'سرعة وأداء'),
        ],
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FeatureCard(icon: Icons.trending_down, title: 'أفضل الأسعار'),
          SizedBox(width: 8),
          FeatureCard(icon: Icons.star_outline, title: 'جودة عالية'),
        ],
      ),
    ]);
  }
}
