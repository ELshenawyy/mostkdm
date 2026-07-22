import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/home_banner_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_categories_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_search_bar_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_top_bar_section.dart';
import 'package:mostkdm/features/home/presentation/widget/ads_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const GetHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AppHeader(
                      height: 450,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const HomeTopBarSection(),
                            const HomeSearchSection(),
                            if (state is HomeSuccess)
                              HomeBannerSection(sliders: state.home.sliders)
                            else
                              const HomeBannerSection(sliders: []),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: -110,
                      child: state is HomeSuccess
                          ? HomeCategoriesSection(categories: state.home.categories)
                          : const HomeCategoriesSection(categories: []),
                    ),
                  ],
                ),
                const SizedBox(height: 110),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const AdsAppBar(),
                ),
                if (state is HomeLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state is HomeSuccess)
                  HomeFeaturedAdsSection(ads: state.home.featuredAds)
                else if (state is HomeError)
                  Center(child: Text(state.message))
                else
                  const HomeFeaturedAdsSection(ads: []),
              ],
            ),
          );
        },
      ),
    );
  }
}