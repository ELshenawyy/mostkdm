import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/models/home_dummy_data.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_bloc.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_event.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_list_section.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_state.dart';
import 'package:mostkdm/features/home/presentation/section/sub_category_filter_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubCategoryView extends StatelessWidget {
  final CategoryModel category;

  const SubCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SubCategoryBloc>()
        ..add(GetCategoryAdsEvent(categoryId: category.id)),
      child: _SubCategoryViewBody(category: category),
    );
  }
}

class _SubCategoryViewBody extends StatefulWidget {
  final CategoryModel category;

  const _SubCategoryViewBody({required this.category});

  @override
  State<_SubCategoryViewBody> createState() => _SubCategoryViewBodyState();
}

class _SubCategoryViewBodyState extends State<_SubCategoryViewBody> {
  List<CategoryModel> _cachedSubCategories = [];

  

  void _onSubCategorySelected(BuildContext context, int? subCategoryId) {
    context.read<SubCategoryBloc>().add(
          GetCategoryAdsEvent(
            categoryId: widget.category.id,
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
            padding: const EdgeInsets.only(
              top: 24.0,
              right: 12,
              left: 12,
            ),
            child: LocalAppBar(
              title: widget.category.name,
              prefixIcon: Icons.arrow_back_outlined,
            ),
          ),

          BlocBuilder<SubCategoryBloc, SubCategoryState>(
            buildWhen: (previous, current) {
              // نعيد البناء فقط لو حصلنا على قائمة جديدة أو كانت أول مرة
              return current is SubCategoryLoaded ||
                  _cachedSubCategories.isEmpty;
            },
            builder: (context, state) {
              final isLoading =
                  state is SubCategoryLoading || state is SubCategoryInitial;

              if (state is SubCategoryLoaded) {
                _cachedSubCategories = state.data.subCategories;
              }

              return Skeletonizer(
                enabled: isLoading && _cachedSubCategories.isEmpty,
                child: SubCategoryFilterSection(
                  subCategories: _cachedSubCategories,
                  onSelected: (id) => _onSubCategorySelected(context, id),
                ),
              );
            },
          ),

          Expanded(
            child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
              builder: (context, state) {
                return switch (state) {
                  SubCategoryInitial() || SubCategoryLoading() => Skeletonizer(
                      enabled: true,
                      child: SubCategoryListSection(ads: HomeDummyData.ads),
                    ),
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
