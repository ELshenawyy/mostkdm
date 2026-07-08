import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/premium_badge.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/slider_indicator.dart';

class AdSliderOverlay extends StatelessWidget {
  final bool isPremium;
  final bool isFavorite;
  final int imageCount;
  final int currentIndex;
  final VoidCallback onBack;
  final VoidCallback onFavorite;

  const AdSliderOverlay({
    super.key,
    required this.isPremium,
    required this.isFavorite,
    required this.imageCount,
    required this.currentIndex,
    required this.onBack,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          right: 16,
          child: GestureDetector(
            onTap: onBack,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withValues(alpha: 0.25),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios,
                  size: 16, color: AppColors.surface),
            ),
          ),
        ),
        Positioned(
          bottom: 64,
          left: 16,
          child: GestureDetector(
            onTap: onFavorite,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withValues(alpha: 0.8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 18,
                color: AppColors.surface,
              ),
            ),
          ),
        ),
        if (isPremium)
          const Positioned(
            top: 40,
            left: 16,
            child: PremiumBadge(),
          ),
        Positioned(
          bottom: 64,
          left: 0,
          right: 0,
          child: SliderIndicator(
            count: imageCount,
            currentIndex: currentIndex,
          ),
        ),
      ],
    );
  }
}