//  TODO : 
 // features/category/presentation/sections/category_list_section.dart

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mostkdm/core/router/router_names.dart';
// import 'package:mostkdm/core/theme/app_images.dart';
// import 'package:mostkdm/features/home/data/models/category_model.dart';
// import 'package:mostkdm/features/home/presentation/widget/category_list_item.dart';

// class CategoryListSection extends StatefulWidget {
//   const CategoryListSection({super.key});

//   static const _categories = [
//     CategoryModel(icon: AppImages.shield, title: 'سيارات', count: 500),
//     CategoryModel(icon: AppImages.shield, title: 'أثاث', count: 100),
//     CategoryModel(icon: AppImages.shield, title: 'ألعاب', count: 30),
//     CategoryModel(icon: AppImages.shield, title: 'جوالات', count: 22),
//     CategoryModel(icon: AppImages.shield, title: 'أزياء', count: 200),
//     CategoryModel(icon: AppImages.shield, title: 'عقارات', count: 100),
//     CategoryModel(icon: AppImages.shield, title: 'خدمات', count: 10),
//     CategoryModel(icon: AppImages.shield, title: 'كتب', count: 78),
//   ];

//   @override
//   State<CategoryListSection> createState() => _CategoryListSectionState();
// }

// class _CategoryListSectionState extends State<CategoryListSection> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(16),
//       itemCount: CategoryListSection._categories.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 10),
//       itemBuilder: (context, i) => CategoryListItem(
//           isSelected: i == selectedIndex,
//           icon: CategoryListSection._categories[i].icon,
//           title: CategoryListSection._categories[i].title,
//           count: CategoryListSection._categories[i].count,
//           onTap: () {
//             setState(() => selectedIndex = i);

//             context.push(RouteNames.subCategory,
//                 extra: CategoryListSection._categories[i].title);
//           }),
//     );
//   }
// }
