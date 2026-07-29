import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/data/datasource/ad_details_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/repository/ad_details_repository.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/ad_details_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/add_ad_stepper_section.dart';

class AddAdView extends StatelessWidget {
  final String? adId;

  const AddAdView({super.key, this.adId});

  @override
  Widget build(BuildContext context) {
    if (adId == null) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: LocalAppBar(title: 'إضافة إعلان جديد'),
              ),
              const Expanded(child: AddAdStepperSection(ad: null)),
            ],
          ),
        ),
      );
    }

    return BlocProvider(
      create: (_) => AdDetailsBloc(
        AdDetailsRepositoryImpl(AdDetailsRemoteDataSourceImpl()),
      )..add(GetAdDetailsEvent(adId: adId!)),
      child: const _AddAdViewBody(),
    );
  }
}

class _AddAdViewBody extends StatelessWidget {
  const _AddAdViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: LocalAppBar(title: 'تعديل الإعلان'),
            ),
            Expanded(
              child: BlocBuilder<AdDetailsBloc, AdDetailsState>(
                builder: (context, state) {
                  return switch (state) {
                    AdDetailsInitial() ||
                    AdDetailsLoading() =>
                      const Center(child: CircularProgressIndicator()),
                    AdDetailsError(:final message) =>
                      Center(child: Text(message)),
                    AdDetailsLoaded(:final adDetailsModel) =>
                      AddAdStepperSection(ad: adDetailsModel),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
