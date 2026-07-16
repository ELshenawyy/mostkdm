import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/data/dummy.dart';
import 'package:mostkdm/features/favorite/presentation/section/favorites_empty_section.dart';

class FavoriteAdsSection extends StatefulWidget {
  const FavoriteAdsSection({super.key});

  @override
  State<FavoriteAdsSection> createState() => _FavoriteAdsSectionState();
}

class _FavoriteAdsSectionState extends State<FavoriteAdsSection> {
  final Set<String> _favoriteIds = {};
  final _ads = List<AdDetailsModel>.from(dummyAds);
  @override
  Widget build(BuildContext context) {
    final favAds = _ads.where((ad) => _favoriteIds.contains(ad.id)).toList();

    if (favAds.isEmpty) return const FavoritesEmptySection();
    if (_ads.isEmpty) return const FavoritesEmptySection();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _ads.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final ad = _ads[i];

        return AppAdCard(
          image: ad.images.first,
          title: ad.title,
          price: ad.price.toString(),
          location: ad.city,
          date: 'منذ ${ad.daysAgo} يوم',
          views: '${ad.views} مشاهدة',
          isFavorite: true,
          onFavTap: () => setState(() => _favoriteIds.remove(ad.id)),
          onTap: () => context.push(
            RouteNames.adsDetails,
            extra: ad.id,
          ),
        );
      },
    );
  }
}
