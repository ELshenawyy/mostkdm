import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/home/data/models/category_model.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/widget/category_list_item.dart';

class CategoryListSection extends StatefulWidget {
  final List<CategoryModel> categories; // ← جديد

  const CategoryListSection({super.key, required this.categories});

  @override
  State<CategoryListSection> createState() => _CategoryListSectionState();
}

class _CategoryListSectionState extends State<CategoryListSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) => CategoryListItem(
        isSelected: i == selectedIndex,
        image: widget.categories[i].image, 
        title: widget.categories[i].name,
        count: widget.categories[i].adsCount,
        onTap: () {
          setState(() => selectedIndex = i);
          context.push(
            RouteNames.subCategory,
            extra: widget.categories[i].name,
          );
        },
      ),
    );
  }
}