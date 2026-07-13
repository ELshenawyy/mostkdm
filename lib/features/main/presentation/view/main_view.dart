import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/advertisement/presentation/view/add_ad_view.dart';
import 'package:mostkdm/features/advertisement/presentation/view/ads_datails_view.dart';
import 'package:mostkdm/features/advertisement/presentation/view/my_ads_view.dart';
import 'package:mostkdm/features/chat/presentation/view/chat_view.dart';
import 'package:mostkdm/features/home/presentation/view/ads_view.dart';
import 'package:mostkdm/features/home/presentation/view/home_view.dart';
import 'package:mostkdm/features/main/presentation/section/main_nav_bar_section.dart';
import 'package:mostkdm/features/settings/presentation/view/more_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomeView(),
    MyAdsView(),
    SizedBox(),
    ChatsView(),
        MoreView(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
  onPressed: () => context.push(RouteNames.addAd), 
        backgroundColor: AppColors.secondaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainNavBarSection(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
