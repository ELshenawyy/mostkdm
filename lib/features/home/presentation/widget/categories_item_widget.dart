import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class CategoriesItemWidget extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onTap;

  const CategoriesItemWidget(
      {super.key, required this.image, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(image: AssetImage(image), height: 40, width: 36),
          SizedBox(height: 8),
          Text(label, style: AppTextStyle.textFieldHeader),
        ],
      ),
    );
  }
}
