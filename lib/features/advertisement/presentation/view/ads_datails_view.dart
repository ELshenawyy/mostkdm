import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_dummy_data.dart'; 
import 'package:mostkdm/features/advertisement/presentation/bloc/ad_details_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_description_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_image_slider_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/ad_title_price_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';
import 'package:mostkdm/features/advertisement/presentation/section/seller_info_section.dart';

class AdDetailsView extends StatelessWidget {
  final String adId;

  const AdDetailsView({super.key, required this.adId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AdDetailsBloc>()..add(GetAdDetailsEvent(adId: adId)),
      child: Scaffold(
        body: BlocBuilder<AdDetailsBloc, AdDetailsState>(
          builder: (context, state) {
            final isLoading = state is AdDetailsInitial || state is AdDetailsLoading;

            if (state is AdDetailsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(fontFamily: 'Cairo'),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => context
                          .read<AdDetailsBloc>()
                          .add(GetAdDetailsEvent(adId: adId)),
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            final adDetails = state is AdDetailsLoaded
                ? state.adDetailsModel
                : AdDetailsDummyData.dummyAd;

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    AdImageSliderSection(ad: adDetails),
                    Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                            AdTitlePriceSection(ad: adDetails),
                            AdDescriptionSection(ad: adDetails),
                            SellerSection(ad: adDetails),
                            const HeaderSection(label: "إعلانات مشابهة"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}