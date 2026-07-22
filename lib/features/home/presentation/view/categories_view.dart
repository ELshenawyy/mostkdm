import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/category_list_section.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: LocalAppBar(
              title: "التصنيفات",
            ),
          ),
          Expanded(child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return CategoryListSection(
                  categories: state.home.categories,
                );
              }
              if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
        ],
      ),
    );
  }
}
