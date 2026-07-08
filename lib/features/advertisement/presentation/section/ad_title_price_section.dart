import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';

class AdTitlePriceSection extends StatelessWidget {
  final AdDetailsModel ad;

  const AdTitlePriceSection({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(ad.title, style: AppTextStyle.headline2),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${ad.price.toStringAsFixed(0)} @',
              style: AppTextStyle.headline1.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Container(
              width: 60,
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'نشط',
                style: AppTextStyle.textBannerHeadline2,),
              ),
            
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // الموقع
            Row(
              children: [
                Text(ad.city,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 4),
                const Icon(Icons.location_on_outlined,
                    size: 14, color: Colors.grey),
              ],
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                Text('منذ ${ad.daysAgo} ساعة',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 4),
                const Icon(Icons.access_time,
                    size: 14, color: AppColors.primaryColor),
              ],
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                Text('${ad.views}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 4),
                const Icon(Icons.remove_red_eye_outlined,
                    size: 14, color: AppColors.primaryColor),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
