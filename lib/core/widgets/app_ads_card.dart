import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class AppAdCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String location;
  final String date;
  final String views;
  final VoidCallback? onTap;
  final VoidCallback? onFavTap;
  final Widget? bottomWidget;
  final bool isFavorite;

  const AppAdCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.location,
    required this.date,
    required this.views,
    this.onTap,
    this.onFavTap,
    this.bottomWidget,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
final isSkeletonEnabled = Skeletonizer.maybeOf(context)?.enabled ?? false;
    return GestureDetector(
      onTap: isSkeletonEnabled ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: SizedBox(
                    height: 151,
                    width: double.infinity,
                    // أثناء الـ Skeleton نكتفي بـ Container رمادي ليأخذ تأثير اللمعة بدون محاولة تحميل صورة
                    child: isSkeletonEnabled || image.isEmpty
                        ? Container(color: AppColors.backgroundColor)
                        : CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: AppColors.backgroundColor,
                              child: const Center(
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: AppColors.backgroundColor,
                              child: const Icon(
                                Icons.image_not_supported_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Skeleton.ignore(
                    child: GestureDetector(
                      onTap: onFavTap,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$price ₴',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.textBannerHeadline2
                              .copyWith(color: AppColors.secondaryColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                size: 16, color: AppColors.primaryColor),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                location,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time,
                                size: 16, color: AppColors.primaryColor),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                date,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.remove_red_eye_outlined,
                                size: 16, color: AppColors.primaryColor),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                views,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (bottomWidget != null) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(12),
                child: bottomWidget!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}