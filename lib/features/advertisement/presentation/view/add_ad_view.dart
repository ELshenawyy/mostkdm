import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/section/add_ad_stepper_section.dart';

class AddAdView extends StatelessWidget {
  const AddAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: LocalAppBar(title: 'إضافة إعلان جديد'),
            ),
            const Expanded(
              child: AddAdStepperSection(),
            ),
          ],
        ),
      ),
    );
  }
}
