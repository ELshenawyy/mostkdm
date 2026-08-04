import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
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
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: LocalAppBar(title: 'إعلاناتي'),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<MyAdsBloc, MyAdsState>(
                builder: (context, state) {
                  return switch (state) {
                    MyAdsInitial() ||
                    MyAdsLoading() =>
                      const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    MyAdsError(:final message) => Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(child: Text(message)),
                      ),
                    MyAdsLoaded(:final ads) => MyAdsListSection(
                        ads: ads,
                        onToggle: (adId) => context
                            .read<MyAdsBloc>()
                            .add(ToggleMyAdActiveEvent(adId: (adId))),
                        onDelete: (adId) => context
                            .read<MyAdsBloc>()
                            .add(DeleteMyAdEvent(adId: adId)),
                      ),
                  };
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}