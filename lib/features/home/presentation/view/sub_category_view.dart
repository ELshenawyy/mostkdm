import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_filter_section.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_list_section.dart';

class SubCategoryView extends StatelessWidget {
  final String title;
  const SubCategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child:  LocalAppBar(title: title,),
          ),
          const SubCategoryFilterSection(),
          const Expanded(
            child: SubCategoryListSection(),
          ),
        ],
      ),
    );
  }
}