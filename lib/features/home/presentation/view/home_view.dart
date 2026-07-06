import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/features/home/presentation/section/home_banner_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_categories_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_search_bar_section.dart';
import 'package:mostkdm/features/home/presentation/section/home_top_bar_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AppHeader(
                height: 450,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      HomeTopBarSection(),
                      HomeSearchSection(),
                      HomeBannerSection(),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: -110,
                child: HomeCategoriesSection(),
              ),
            ],
          ),
          const SizedBox(height: 110),

          HomeFeaturedAdsSection(),
        ],
      ),
    );
  }
}
