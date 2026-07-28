import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_bloc.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_event.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_state.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_filter_section.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_list_section.dart';

class SubCategoryView extends StatelessWidget {
  final CategoryModel category;

  const SubCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SubCategoryBloc()..add(GetCategoryAdsEvent(categoryId: category.id)),
      child: _SubCategoryViewBody(category: category),
    );
  }
}

class _SubCategoryViewBody extends StatelessWidget {
  final CategoryModel category;

  const _SubCategoryViewBody({required this.category});

  void _onSubCategorySelected(BuildContext context, int? subCategoryId) {
    context.read<SubCategoryBloc>().add(
          GetCategoryAdsEvent(
            categoryId: category.id,
            subCategoryId: subCategoryId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: LocalAppBar(title: category.name),
          ),
          BlocBuilder<SubCategoryBloc, SubCategoryState>(
            builder: (context, state) {
              final subCategories = state is SubCategoryLoaded
                  ? state.data.subCategories
                  : const <CategoryModel>[];
              return SubCategoryFilterSection(
                subCategories: subCategories,
                onSelected: (id) => _onSubCategorySelected(context, id),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
              builder: (context, state) {
                return switch (state) {
                  SubCategoryInitial() ||
                  SubCategoryLoading() =>
                    const Center(child: CircularProgressIndicator()),
                  SubCategoryError(:final message) =>
                    Center(child: Text(message)),
                  SubCategoryLoaded(:final data) =>
                    SubCategoryListSection(ads: data.ads),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
