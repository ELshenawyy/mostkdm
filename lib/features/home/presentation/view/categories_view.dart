import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/section/category_list_section.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: LocalAppBar(
              title: "التصنيفات",
            ),
          ),
        //  Expanded(child: CategoryListSection()),
        ],
      ),
    );
  }
}
