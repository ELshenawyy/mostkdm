import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_event.dart';
import 'package:skeletonizer/skeletonizer.dart'; 
import 'package:mostkdm/core/utils/core_dummy_data.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_bloc.dart';
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
      // 👈 2. استخدام SafeArea يحل مشكلة الـ LocalAppBar الطالع لفوق في النوتش
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: LocalAppBar(
                  title: "الإعلانات",
                  prefixIcon: Icons.arrow_back_outlined,
                ),
              ),
              BlocBuilder<AdsListBloc, AdsListState>(
                builder: (context, state) {
                  final isLoading = state is AdsListLoading || state is AdsListInitial;

                  if (state is AdsListError) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(child: Text(state.message)),
                    );
                  }

                  // 👈 3. توفير Skeletonizer للشاشة بأكملها
                  return Skeletonizer(
                    enabled: isLoading,
                    child: HomeFeaturedAdsSection(
                      ads: state is AdsListLoaded
                          ? state.ads
                          : CoreDummyData.dummyAdsList, // بيانات وهمية أثناء التحميل
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}