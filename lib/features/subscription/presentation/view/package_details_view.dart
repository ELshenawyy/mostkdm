import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/subscription/data/models/packages_dummy_data.dart';
import 'package:mostkdm/features/subscription/data/models/packages_model.dart';
import 'package:mostkdm/features/subscription/presentation/bloc/packages_bloc.dart';

class PackageDetailsView extends StatefulWidget {
  final PackageModel? package;

  const PackageDetailsView({super.key, this.package});

  @override
  State<PackageDetailsView> createState() => _PackageDetailsViewState();
}

class _PackageDetailsViewState extends State<PackageDetailsView> {
  int _selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PackagesBloc>(),
      child: BlocConsumer<PackagesBloc, PackagesState>(
        listener: (context, state) {
          if (state is PackageSubscriptionSuccess) {
            final paymentUrl = state.subscription.paymentUrl;

            if (paymentUrl != null && paymentUrl.isNotEmpty) {
              context.push(RouteNames.paymentWebView, extra: paymentUrl);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم الإشتراك في الباقة بنجاح!'),
                  backgroundColor: Colors.green,
                ),
              );
              context.pop();
            }
          }

          if (state is PackageSubscriptionError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isSubscribing = state is PackageSubscriptionLoading;
          final isPageLoading = state is PackagesLoading;
          
          final currentPackage = widget.package ?? PackagesDummyData.dummyPackage;

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppHeader(
                    height: 120,
                    child: SafeArea(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: LocalAppBar(
                              title: 'تفاصيل الباقة',
                              isLight: true,
                              prefixIcon: Icons.arrow_back_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Skeletonizer(
                        enabled: isPageLoading,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dynamic Subscription Card
                            AppSubscriptionCard(
                              title: currentPackage.title,
                              subtitle: currentPackage.content,
                              price: currentPackage.price.toString(),
                              badge: currentPackage.typeLabel.isNotEmpty
                                  ? currentPackage.typeLabel
                                  : null,
                              buttonLabel: currentPackage.isActive
                                  ? 'تجديد الإشتراك'
                                  : 'إشتراك',
                              onTap: () {
                                if (isPageLoading || isSubscribing) return;
                                _onSubscribePressed(context, currentPackage.id);
                              },
                              icon: currentPackage.isActive
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              features: currentPackage.features
                                  .map<SubscriptionFeature>(
                                    (f) => SubscriptionFeature(
                                      title: f.title,
                                      subtitle: f.description,
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'إختيار وسيلة الدفع',
                              style:
                                  AppTextStyle.headline1.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'قم بإختيار وسيلة الدفع للإشتراك في الباقة',
                              style: AppTextStyle.headline2,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.primaryColor
                                      .withValues(alpha: 0.1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (currentPackage.isActive) ...[
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'نشط',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  _buildPaymentOption(0, 'الدفع بالمحفظة'),
                                  const SizedBox(height: 8),
                                  _buildPaymentOption(1, 'بوابة دفع إلكترونية'),
                                  const SizedBox(height: 16),
                                  AppButton(
                                    label: currentPackage.isActive
                                        ? 'تجديد الإشتراك'
                                        : 'إشتراك',
                                    isLoading: isSubscribing,
                                    onTap: () {
                                      if (isPageLoading || isSubscribing) return;
                                      _onSubscribePressed(
                                          context, currentPackage.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSubscribePressed(BuildContext context, int packageId) {
    final paymentMethod = _selectedPayment == 0 ? 'wallet' : 'online';
    context.read<PackagesBloc>().add(
          SubscribeToPackageEvent(
            packageId: packageId,
            paymentMethod: paymentMethod,
          ),
        );
  }

  Widget _buildPaymentOption(int index, String label) {
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _selectedPayment == index
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyle.textFieldHeader),
            Radio<int>(
              value: index,
              groupValue: _selectedPayment,
              activeColor: AppColors.primaryColor,
              onChanged: (v) => setState(() => _selectedPayment = v!),
            ),
          ],
        ),
      ),
    );
  }
}