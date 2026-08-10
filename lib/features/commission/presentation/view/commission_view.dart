import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_bloc.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_event.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_ads_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_exempt_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_payment_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_price_section.dart';

class CommissionView extends StatelessWidget {
  const CommissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CommissionBloc>()..add(GetCommissionAdsEvent()),
      child: const _CommissionViewBody(),
    );
  }
}

class _CommissionViewBody extends StatelessWidget {
  const _CommissionViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommissionBloc, CommissionState>(
      listener: (context, state) {
        if (state.calculateException != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.calculateException!.message)),
          );
        }
        if (state.payException != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.payException!.message)),
          );
        }
      },
      child: BlocBuilder<CommissionBloc, CommissionState>(
        builder: (context, state) {
          final bloc = context.read<CommissionBloc>();

          return PopScope(
            canPop: state.currentStep == CommissionStep.ads,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              bloc.add(GoToPreviousStepEvent());
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: AppHeader(
                        height: 120,
                        child: LocalAppBar(
                          title: 'دفع العمولة',
                          isLight: true,
                          onIconTap: () {
                            if (state.currentStep == CommissionStep.ads) {
                              Navigator.pop(context);
                            } else {
                              bloc.add(GoToPreviousStepEvent());
                            }
                          },
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color:
                                  AppColors.primaryColor.withValues(alpha: 0.1),
                            ),
                          ),
                          child: switch (state.currentStep) {
                            CommissionStep.ads => const CommissionAdsSection(),
                            CommissionStep.price =>
                              const CommissionPriceSection(),
                            CommissionStep.payment =>
                              const CommissionPaymentSection(),
                            CommissionStep.exempt =>
                              const CommissionExemptSection(),
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
