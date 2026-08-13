import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/data/models/home_dummy_data.dart';
import 'package:mostkdm/features/home/presentation/bloc/categories_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/category_list_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesBloc>()..add(const GetCategoriesEvent()),
      child: const _CategoriesViewBody(),
    );
  }
}

class _CategoriesViewBody extends StatelessWidget {
  const _CategoriesViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24.0, right: 12, left: 12),
            child: LocalAppBar(
              title: "التصنيفات",
              prefixIcon: Icons.arrow_back_outlined,
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                return switch (state) {
                  CategoriesInitial() || CategoriesLoading() => Skeletonizer(
                      enabled: true,
                      child: CategoryListSection(
                        categories: HomeDummyData.categories,
                      ),
                    ),
                  CategoriesError(:final message) =>
                    Center(child: Text(message)),
                  CategoriesLoaded(:final categories) =>
                    CategoryListSection(categories: categories),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
