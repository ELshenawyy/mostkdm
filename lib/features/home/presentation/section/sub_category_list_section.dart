import 'package:flutter/widgets.dart';
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/home/data/models/ads_model.dart';

class SubCategoryListSection extends StatelessWidget {
    final List<AdModel>  ads;

  const SubCategoryListSection({super.key, required this.ads});


  @override

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: ads.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) => AppAdCard(
        image: ads[i].cover,
        title: ads[i].title,
        price: ads[i].price,
        location: ads[i].location,
        date: ads[i].createdAt,
        views: '${ads[i].visitedCount} مشاهدة',
      ),
    );
  }
}