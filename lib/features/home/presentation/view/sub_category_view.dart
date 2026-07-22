import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
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
            child: LocalAppBar(title: title),
          ),
          const SubCategoryFilterSection(),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccess) {
                  return SubCategoryListSection(
                    ads: state.home.featuredAds
                        .where((ad) => ad.category?['name'] == title)
                        .toList(),
                  );
                }
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SubCategoryListSection(ads: []);
              },
            ),
          ),
        ],
      ),
    );
  }
}