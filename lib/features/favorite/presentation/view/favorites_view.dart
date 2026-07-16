import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/favorite/presentation/section/favorite_ads_section.dart';
import 'package:mostkdm/features/favorite/presentation/section/following_users_section.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            height: 120,
            child: SafeArea(
              child: Column(
                children: [
                  LocalAppBar(
                    title: 'المفضلة والمتابعة',
                    isLight: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.textHintColor,
              unselectedLabelColor: AppColors.ghostBtnText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              dividerColor: AppColors.backgroundColor,
              tabs: const [
                Tab(text: 'الإعلانات المفضلة'),
                Tab(text: 'الحسابات المتابعة'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SingleChildScrollView(child: FavoriteAdsSection()),
                SingleChildScrollView(child: FollowingUsersSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
