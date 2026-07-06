import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/home/data/ads_model.dart';
import 'package:mostkdm/features/home/presentation/widget/ads_app_bar.dart';

class HomeFeaturedAdsSection extends StatelessWidget {
  static const _ads = [
    AdsModel(
      image: AppImages.car,
      title: 'تويوتا كامرى 2024',
      price: '95,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 2 يوم',
      views: '260 مشاهدة',
    ),
    AdsModel(
      image: AppImages.banner,
      title: ' كاميرا 2026',
      price: '40,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 1 يوم',
      views: '260 مشاهدة',
    ),
    AdsModel(
      image: AppImages.car,
      title: 'تويوتا كامرى 2024',
      price: '95,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 8 يوم',
      views: '260 مشاهدة',
    ),
  ];
  const HomeFeaturedAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AdsAppBar(),
          ListView.separated(
            itemCount: _ads.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final ad = _ads[index];
              return AppAdCard(
                image: ad.image,
                title: ad.title,
                price: ad.price,
                location: ad.location,
                date: ad.date,
                views: ad.views,
              );
            },
            
          ),
        ],
      ),
    );
  }
}
