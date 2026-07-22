// TODO: implement SubCategoryListSection

// import 'package:flutter/widgets.dart';
// import 'package:mostkdm/core/widgets/app_ads_card.dart';
// import 'package:mostkdm/features/home/data/models/ads_model.dart';

// class SubCategoryListSection extends StatelessWidget {
//   const SubCategoryListSection({super.key});

//   static const _ads = [
//     AdModel(
//       title: 'تويوتا كامرى 2024',
//       price: '95,000',
//       location: 'الرياض، الدرعية، حى السلامة',
//       views: '260 مشاهدة',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(16),
//       itemCount: _ads.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 12),
//       itemBuilder: (context, i) => AppAdCard(
//         image: _ads[i].image,
//         title: _ads[i].title,
//         price: _ads[i].price,
//         location: _ads[i].location,
//         date: _ads[i].date,
//         views: _ads[i].views,
//       ),
//     );
//   }
// }