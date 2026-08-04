import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/ad_details_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_image_slider_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/seller_info_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_description_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_title_price_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';

class AdsDatailsView extends StatelessWidget {
  final String adId;

  const AdsDatailsView({super.key, required this.adId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AdDetailsBloc>()..add(GetAdDetailsEvent(adId: adId)),
      child: Builder(
        builder: (context) => Scaffold(
          body: BlocBuilder<AdDetailsBloc, AdDetailsState>(
            builder: (context, state) {
              return switch (state) {
                AdDetailsInitial() ||
                AdDetailsLoading() =>
                  const Center(child: CircularProgressIndicator()),
                AdDetailsError(:final message) =>
                  Center(child: Text(message)),
                AdDetailsLoaded(:final adDetailsModel) =>
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        AdImageSliderSection(ad: adDetailsModel),
                        Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              spacing: 20,
                              children: [
                                AdTitlePriceSection(ad: adDetailsModel),
                                AdDescriptionSection(ad: adDetailsModel),
                                SellerSection(ad: adDetailsModel),
                                HeaderSection(label: "إعلانات مشابهة"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}