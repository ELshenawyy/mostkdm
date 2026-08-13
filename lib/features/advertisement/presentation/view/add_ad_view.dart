import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/ad_details_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/add_ad_stepper_section.dart';

class AddAdView extends StatelessWidget {
  final String? adId;

  const AddAdView({super.key, this.adId});

  @override
  Widget build(BuildContext context) {
    if (adId == null) {
      return BlocProvider(
        create: (_) => getIt<AddAdBloc>()..add(LoadLookupDataEvent()),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                  child: LocalAppBar(title: 'إضافة إعلان جديد',prefixIcon: Icons.arrow_back_outlined,),
                ),
                const Expanded(child: AddAdStepperSection()),
              ],
            ),
          ),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<AdDetailsBloc>()..add(GetAdDetailsEvent(adId: adId!)),
        ),
        BlocProvider(create: (_) => getIt<AddAdBloc>()..add(LoadLookupDataEvent())),
      ],
      child: _EditAdViewBody(adId: adId!),
    );
  }
}

class _EditAdViewBody extends StatelessWidget {
  final String adId;

  const _EditAdViewBody({required this.adId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              child: LocalAppBar(title: 'تعديل الإعلان',prefixIcon: Icons.arrow_back_outlined,),
            ),
            Expanded(
              child: BlocConsumer<AdDetailsBloc, AdDetailsState>(
                listener: (context, state) {
                  if (state is AdDetailsLoaded) {
                    context.read<AddAdBloc>().add(
                          PrefillFromAdEvent(
                            adId: int.parse(adId),
                            ad: state.adDetailsModel,
                          ),
                        );
                  }
                },
                builder: (context, state) {
                  return switch (state) {
                    AdDetailsInitial() ||
                    AdDetailsLoading() =>
                      const Center(child: CircularProgressIndicator()),
                    AdDetailsError(:final message) =>
                      Center(child: Text(message)),
                    AdDetailsLoaded() => const AddAdStepperSection(),
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