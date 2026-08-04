import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
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
    return BlocConsumer<AddAdBloc, AddAdState>(
      listenWhen: (previous, current) =>
          previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == AddAdSubmissionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم حفظ الإعلان بنجاح')),
          );
          context.pop();
        } else if (state.submissionStatus == AddAdSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'حدث خطأ، حاول مرة أخرى'),
            ),
          );
        }
      },
      builder: (context, state) {
        final isSubmitting =
            state.submissionStatus == AddAdSubmissionStatus.submitting;

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
                label: isSubmitting
                    ? 'جارِ الحفظ...'
                    : (_currentStep == _totalSteps ? 'حفظ' : 'التالي'),
                onTap: isSubmitting
                    ? null
                    : (_currentStep == _totalSteps
                        ? () => context
                            .read<AddAdBloc>()
                            .add(const SubmitAdEvent())
                        : _nextStep),
                kind: AppButtonKind.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}