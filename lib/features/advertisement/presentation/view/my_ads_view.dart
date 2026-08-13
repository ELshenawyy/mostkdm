import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/utils/core_dummy_data.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/my_ads_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/my_ads_list_section.dart';

class MyAdsView extends StatelessWidget {
  const MyAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<MyAdsBloc>()..add(const GetMyAdsEvent());
    return BlocProvider.value(
      value: bloc,
      child: const _MyAdsViewBody(),
    );
  }
}

class _MyAdsViewBody extends StatelessWidget {
  const _MyAdsViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: LocalAppBar(
              title: 'إعلاناتي',
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<MyAdsBloc, MyAdsState>(
                builder: (context, state) {
                  final isLoading = state is MyAdsLoading || state is MyAdsInitial;

                  if (state is MyAdsError) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(child: Text(state.message)),
                    );
                  }

                  final List<AdModel>adsList = isLoading
                      ? CoreDummyData.dummyAdsList
                      : (state is MyAdsLoaded ? state.ads : []);

                  return Skeletonizer(
                    enabled: isLoading,
                    child: MyAdsListSection(
                      ads: adsList,
                      onToggle: (adId) {
                        if (!isLoading) {
                          context
                              .read<MyAdsBloc>()
                              .add(ToggleMyAdActiveEvent(adId: adId));
                        }
                      },
                      onDelete: (adId) {
                        if (!isLoading) {
                          context
                              .read<MyAdsBloc>()
                              .add(DeleteMyAdEvent(adId: adId));
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}