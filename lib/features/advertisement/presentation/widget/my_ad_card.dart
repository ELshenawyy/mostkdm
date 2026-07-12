import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';

class MyAdCard extends StatelessWidget {
  final AdDetailsModel ad;
  final bool isActive;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const MyAdCard({
    super.key,
    required this.ad,
    this.isActive = true,
    this.onToggle,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AppAdCard(
      image: ad.images.first,
      title: ad.title,
      price: ad.price.toStringAsFixed(0),
      location: ad.city,
      date: 'منذ ${ad.daysAgo} يوم',
      views: '${ad.views} مشاهدة',
      bottomWidget: Row(
        children: [
          // edit
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.edit_outlined,
                  size: 18, color: AppColors.secondaryColor),
            ),
          ),
          const SizedBox(width: 8),
          // delete
          GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.delete_outline,
                  size: 18, color: Colors.red),
            ),
          ),
          const SizedBox(width: 8),
          // زرار إيقاف/تشغيل
          Expanded(
            child: AppButton(
              label: isActive ? 'إيقاف الإعلان' : 'تشغيل الإعلان',
              onTap: onToggle,
              kind: isActive
                  ? AppButtonKind.primary
                  : AppButtonKind.secondary,
            ),
          ),
        ],
      ),
    );
  }
}