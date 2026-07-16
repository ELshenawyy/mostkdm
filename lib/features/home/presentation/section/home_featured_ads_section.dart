import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/advertisement/data/dummy.dart';

class HomeFeaturedAdsSection extends StatelessWidget {
   HomeFeaturedAdsSection({super.key});
  final ads = dummyAds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
      ),
      child: Column(
        children: [
          ListView.separated(
            itemCount: ads.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final ad = ads[index];

              return AppAdCard(
                image: ad.images.first,
                title: ad.title,
                price: ad.price.toString(),
                location: ad.city,
                date: 'منذ ${ad.daysAgo} يوم',
                views: '${ad.views} مشاهدة',
                onTap: () => context.push(
                  RouteNames.adsDetails,
                  extra: ad.id,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
