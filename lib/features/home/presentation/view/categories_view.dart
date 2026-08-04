import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/bloc/categories_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/category_list_section.dart';

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
            padding: EdgeInsets.only(top: 12.0),
            child: LocalAppBar(title: "التصنيفات"),
          ),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                return switch (state) {
                  CategoriesInitial() ||
                  CategoriesLoading() =>
                    const Center(child: CircularProgressIndicator()),
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
