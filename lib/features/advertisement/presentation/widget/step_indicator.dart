import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/step_dashed_line.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/step_item.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.onStepTap,
  });

  final int totalSteps;
  final int currentStep;
  final ValueChanged<int>? onStepTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(totalSteps * 2 - 1, (index) {
        // دائرة
        if (index.isEven) {
          final step = index ~/ 2 + 1;

          return StepItem(
            step: step,
            isCurrent: step == currentStep,
            isCompleted: step <= currentStep,
            onTap: () => onStepTap?.call(step),
          );
        }

        // الخط بين الدوائر
        final lineCompleted = (index / 2 + 1) < currentStep;

        return Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: StepDashedLine(
                isCompleted: lineCompleted,
              )),
        );
      }),
    );
  }
}
