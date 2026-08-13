import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_event.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_state.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdsListBloc()..add(const GetAllAdsEvent()),
      child: const _AdsViewBody(),
    );
  }
}

class _AdsViewBody extends StatelessWidget {
  const _AdsViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24,right: 12,left: 12),
              child: LocalAppBar(title: "الإعلانات",prefixIcon: Icons.arrow_back_outlined,),
            ),
            BlocBuilder<AdsListBloc, AdsListState>(
              builder: (context, state) {
                return switch (state) {
                  AdsListInitial() ||
                  AdsListLoading() =>
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  AdsListError(:final message) => Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(child: Text(message)),
                    ),
                  AdsListLoaded(:final ads) =>
                    HomeFeaturedAdsSection(ads: ads),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}