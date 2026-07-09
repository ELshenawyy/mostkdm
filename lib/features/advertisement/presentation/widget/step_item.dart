import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.step,
    required this.isCurrent,
    required this.isCompleted,
    this.onTap,
  });

  final int step;
  final bool isCurrent;
  final bool isCompleted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = (isCurrent || isCompleted)
        ? AppColors.primaryColor
        : AppColors.primaryColor.withValues(alpha: .3);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isCompleted ? AppColors.primaryColor : Colors.transparent,
              border: Border.all(
                color: borderColor,
                width: isCurrent ? 2 : 1,
              ),
            ),
            child:
                 Center(
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surface,
                      ),
                      child: Center(
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCompleted ? AppColors.primaryColor : Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  )
                ,
          ),
          const SizedBox(height: 6),
          Text(
            '$step',
            style: TextStyle(
              fontSize: 15,
              color: borderColor,
            ),
          ),
        ],
      ),
    );
  }
}