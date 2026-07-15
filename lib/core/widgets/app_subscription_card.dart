import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class SubscriptionFeature {
  final String title;
  final String subtitle;

  const SubscriptionFeature({required this.title, required this.subtitle});
}

class AppSubscriptionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
    final IconData? icon;

  final String? price;
  final String? badge;
  final List<SubscriptionFeature> features;
  final String buttonLabel;
  final VoidCallback? onTap;
  final AppButtonKind buttonKind;

  const AppSubscriptionCard({
    super.key,
    required this.title,
    required this.features,
    required this.buttonLabel,
    this.subtitle,
    this.price,
    this.badge,
    this.onTap,
    this.buttonKind = AppButtonKind.secondary, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             if (price != null)
  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyle.headline3),
            if (subtitle != null)
              Text(subtitle!,
                  style: AppTextStyle.textFieldLabel
                      .copyWith(fontSize: 14)),
          ],
        ),
      ),
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(price!,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor)),
          Text('ريال',
              style: AppTextStyle.textBannerHeadline2
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
    ],
  ),
              const SizedBox(height: 12),
              // الفيتشرز
              ...features.map((f) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                           Icon(icon,
                              size: 21, color: AppColors.primaryColor),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(f.title,
                                  style: AppTextStyle.headline3),
                              Text(f.subtitle,
                                  style: AppTextStyle.textFieldLabel
                                      .copyWith(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              AppButton(
                label: buttonLabel,
                onTap: onTap,
                kind: buttonKind,
              ),
            ],
          ),
        ),
        if (badge != null)
          Positioned(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(badge!,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 12)),
            ),
          ),
      ],
    );
  }
}