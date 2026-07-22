import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/home/data/models/ads_model.dart';

class HomeFeaturedAdsSection extends StatelessWidget {
  final List<AdModel> ads; 

  const HomeFeaturedAdsSection({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    if (ads.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
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
                image: ad.cover, // ← cover من الـ API
                title: ad.title,
                price: ad.price,
                location: ad.location,
                date: ad.createdAt,
                views: '${ad.visitedCount} مشاهدة',
                isFavorite: ad.isFavourite,
                onTap: () => context.push(
                  RouteNames.adsDetails,
                  extra: ad.id.toString(),
                ),
                onFavTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}