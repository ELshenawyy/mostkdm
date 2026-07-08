import 'package:flutter/material.dart';
import 'package:mostkdm/features/advertisement/data/dummy.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_image_slider_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/seller_info_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_description_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_title_price_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';

class AdsDatailsView extends StatelessWidget {
  const AdsDatailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AdImageSliderSection(ad: dummyAd),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AdTitlePriceSection(ad: dummyAd),
                    const SizedBox(height: 20),
                    AdDescriptionSection(ad: dummyAd),
                    const SizedBox(height: 20),
                    SellerSection(ad: dummyAd),
                    const SizedBox(height: 20),
                    HeaderSection(label: "إعلانات مشابهة"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
