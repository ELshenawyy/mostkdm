import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:mostkdm/features/subscription/presentation/bloc/packages_bloc.dart';

class SubscriptionsListSection extends StatelessWidget {
  const SubscriptionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesBloc, PackagesState>(
      builder: (context, state) {
        if (state is PackagesLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        if (state is PackagesError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PackagesBloc>().add(const GetPackagesEvent());
                    },
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is PackagesLoaded) {
          if (state.packagesList.isEmpty) {
            return const Center(child: Text('لا توجد باقات متاحة حالياً'));
          }

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.packagesList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final package = state.packagesList[index];

              return AppSubscriptionCard(
                title: package.title,
                subtitle: package.content,
                price: package.price.toString(),
                icon: package.isActive
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                badge: package.typeLabel.isNotEmpty ? package.typeLabel : null,
                features: package.features
                    .map((f) => SubscriptionFeature(
                          title: f.title,
                          subtitle: f.description,
                        ))
                    .toList(),
                buttonLabel: package.isActive ? 'تجديد الإشتراك' : 'إشتراك',
                onTap: () {
                  context.push(RouteNames.packageDetails, extra: package);
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}