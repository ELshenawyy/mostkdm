import 'package:flutter/material.dart';
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
  });

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    width: 310,
                    height: 151,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: onFavTap,
                    child: const Icon(Icons.favorite_border,
                        size: 18, color: AppColors.surface),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$price ₴',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.textBannerHeadline2
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  size: 20, color: AppColors.primaryColor),
                              const SizedBox(width: 4),
                              Text(
                                location,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  size: 20, color: AppColors.primaryColor),
                              const SizedBox(width: 4),
                              Text(
                                date,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.remove_red_eye_outlined,
                                  size: 20, color: AppColors.primaryColor),
                              const SizedBox(width: 4),
                              Text(
                                views,
                                style: AppTextStyle.textFieldLabel
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
