// features/advertisement/presentation/widgets/ad_specification_item.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AdSpecificationItem extends StatelessWidget {
  final String title;
  final String value;

  const AdSpecificationItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 6, color: AppColors.primaryColor),
          const SizedBox(width: 6),
          Text(
            '$title: $value',
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
