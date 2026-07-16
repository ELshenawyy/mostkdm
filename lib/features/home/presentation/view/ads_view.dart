import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: LocalAppBar(
              title: "الإعلانات",
            ),
          ),
          HomeFeaturedAdsSection(),
        ],
      )),
    );
  }
}
