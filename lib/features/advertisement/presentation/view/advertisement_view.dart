import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_list_section.dart';

class AdvertisementView extends StatelessWidget {
  const AdvertisementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        AdsHeaderSection(title: 'الإعلانات',),
        Expanded(child: AdsListSection()),
      ],
    );
  }
}
