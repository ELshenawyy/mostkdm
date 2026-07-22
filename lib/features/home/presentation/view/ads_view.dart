import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: LocalAppBar(title: "الإعلانات"),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccess) {
                  return HomeFeaturedAdsSection(ads: state.home.featuredAds);
                }
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const HomeFeaturedAdsSection(ads: []);
              },
            ),
          ],
        ),
      ),
    );
  }
}