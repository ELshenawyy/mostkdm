import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class SliderIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const SliderIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: currentIndex == i ? 32 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex == i
                ? AppColors.primaryColor
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}