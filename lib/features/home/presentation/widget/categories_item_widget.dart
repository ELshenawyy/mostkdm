import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class CategoriesItemWidget extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onTap;

  const CategoriesItemWidget({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            image,
            height: 40,
            width: 36,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.category_outlined,
              color: AppColors.primaryColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}