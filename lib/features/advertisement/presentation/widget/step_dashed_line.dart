import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class StepDashedLine extends StatelessWidget {
  const StepDashedLine({
    super.key,
    required this.isCompleted,
  });

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final color = isCompleted
        ? AppColors.primaryColor
        : AppColors.primaryColor.withValues(alpha: .25);

    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashSpace = 2.0;

        final dashCount =
            (constraints.maxWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => Container(
              width: dashWidth,
              height: 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      },
    );
  }
}