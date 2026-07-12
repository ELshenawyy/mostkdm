import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/presentation/section/add_ad_stepper_section.dart';

class AddAdView extends StatelessWidget {
  final AdDetailsModel? ad;
  const AddAdView({super.key, this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: LocalAppBar(
                title: ad != null ? 'تعديل الإعلان' : 'إضافة إعلان جديد',
              ),
            ),
            Expanded(
              child: AddAdStepperSection(ad: ad),
            ),
          ],
        ),
      ),
    );
  }
}
