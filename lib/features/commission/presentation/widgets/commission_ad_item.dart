import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class CommissionAdItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool isPaid;
  final VoidCallback? onTap;

  const CommissionAdItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.isPaid = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  Image.asset(image, width: 56, height: 56, fit: BoxFit.cover),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150,
                    child: Text(
                      title,
                      style: AppTextStyle.textFieldHeader,
                    )),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: AppTextStyle.headline3),
                    const SizedBox(width: 8),
                    if (isPaid)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('معفى',
                                style: AppTextStyle.textFieldHeader),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
