import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

class SearchResultsSection extends StatelessWidget {
  final List<AdModel> ads;

  const SearchResultsSection({super.key, required this.ads});

  int _daysAgo(String createdAt) {
    try {
      return DateTime.now().difference(DateTime.parse(createdAt)).inDays;
    } catch (_) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ads.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final ad = ads[i];

        return AppAdCard(
          image: ad.cover,
          title: ad.title,
          price: ad.price,
          location: ad.location,
          date: 'منذ ${_daysAgo(ad.createdAt)} يوم',
          views: '${ad.visitedCount} مشاهدة',
          onTap: () => context.push(
            RouteNames.adsDetails,
            extra: ad.id.toString(),
          ),
        );
      },
    );
  }
}