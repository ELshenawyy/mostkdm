import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/home/data/ads_model.dart';

class SearchResultsSection extends StatelessWidget {
  const SearchResultsSection({super.key});

  static const _results = [
    AdsModel(
      image: AppImages.car,
      title: 'تويوتا كامرى 2024',
      price: '95,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 2 يوم',
      views: '260 مشاهدة',
    ),
    AdsModel(
      image: AppImages.car,
      title: 'BMW 2024',
      price: '95,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 2 يوم',
      views: '260 مشاهدة',
    ),
    AdsModel(
      image: AppImages.car,
      title: 'BMW 2024',
      price: '95,000',
      location: 'الرياض، الدرعية، حى السلامة',
      date: 'منذ 2 يوم',
      views: '260 مشاهدة',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) => AppAdCard(
        image: _results[i].image,
        title: _results[i].title,
        price: _results[i].price,
        location: _results[i].location,
        date: _results[i].date,
        views: _results[i].views,
        onTap: () => context.push(RouteNames.adsDetails, extra: _results[i]),
      ),
    );
  }
}