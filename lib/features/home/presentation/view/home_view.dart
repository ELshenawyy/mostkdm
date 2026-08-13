import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/home_search_bar_section.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/utils/core_dummy_data.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/home_banner_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_categories_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_top_bar_section.dart';
import 'package:mostkdm/features/home/presentation/widget/ads_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const GetHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final isLoading = state is HomeLoading || state is HomeInitial;

          return Skeletonizer(
            enabled: isLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AppHeader(
                        child: SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 70, 
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Skeleton.ignore(
                                    child: HomeTopBarSection()),
                                const SizedBox(height: 12),
                                const HomeSearchSection(),
                                const SizedBox(height: 16),
                                HomeBannerSection(
                                  sliders: state is HomeSuccess
                                      ? state.home.sliders
                                      : CoreDummyData.dummySliders,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: -200, 
                        child: HomeCategoriesSection(
                          categories: state is HomeSuccess
                              ? state.home.categories
                              : CoreDummyData.dummyCategories,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 220),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Skeleton.ignore(child: AdsAppBar()),
                  ),

                  if (state is HomeError)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(state.message),
                      ),
                    )
                  else
                    HomeFeaturedAdsSection(
                      ads: state is HomeSuccess
                          ? state.home.featuredAds
                          : CoreDummyData.dummyAdsList,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}