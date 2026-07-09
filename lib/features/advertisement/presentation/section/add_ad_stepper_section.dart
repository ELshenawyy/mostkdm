import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/presentation/section/add_images_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/basic_info_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/category_location_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/contact_methods_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/subscription_section.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/step_indicator.dart';

class AddAdStepperSection extends StatefulWidget {
  const AddAdStepperSection({super.key});

  @override
  State<AddAdStepperSection> createState() => _AddAdStepperSectionState();
}

class _AddAdStepperSectionState extends State<AddAdStepperSection> {
  int _currentStep = 1;
  final int _totalSteps = 5;
  static const List<Widget> _steps = [
    BasicInfoSection(),
    CategoryLocationSection(),
    AddImagesSection(),
    ContactMethodsSection(),
    SubscriptionSection(),
  ];

  void _nextStep() {
    if (_currentStep < _totalSteps) setState(() => _currentStep++);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StepIndicator(
            totalSteps: _totalSteps,
            currentStep: _currentStep,
            onStepTap: (step) => setState(() => _currentStep = step),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _steps[_currentStep - 1],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppButton(
            label: 'التالي',
            onTap: _nextStep,
            kind: AppButtonKind.secondary,
          ),
        ),
      ],
    );
  }
}
