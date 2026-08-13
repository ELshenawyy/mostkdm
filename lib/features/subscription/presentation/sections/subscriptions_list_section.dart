import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:mostkdm/features/subscription/data/models/packages_dummy_data.dart';
import 'package:mostkdm/features/subscription/presentation/bloc/packages_bloc.dart';

class SubscriptionsListSection extends StatelessWidget {
  const SubscriptionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesBloc, PackagesState>(
      builder: (context, state) {
        final isLoading = state is PackagesLoading;

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
                      context.read<PackagesBloc>().add(GetPackagesEvent());
                    },
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        final packagesList = isLoading
            ? PackagesDummyData.dummyPackagesList
            : (state is PackagesLoaded ? state.packagesList : []);

        if (!isLoading && packagesList.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('لا توجد باقات متاحة حالياً'),
            ),
          );
        }

        return Skeletonizer(
          enabled: isLoading,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: packagesList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final package = packagesList[index];

              return AppSubscriptionCard(
                title: package.title,
                subtitle: package.content,
                price: package.price.toString(),
                icon: package.isActive
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                badge: package.typeLabel.isNotEmpty ? package.typeLabel : null,
                features: package.features
    .map<SubscriptionFeature>((f) => SubscriptionFeature(
          title: f.title,
          subtitle: f.description,
        ))
    .toList(),
                buttonLabel: package.isActive ? 'تجديد الإشتراك' : 'إشتراك',
                onTap: () {
                  if (isLoading) return;
                  context.push(RouteNames.packageDetails, extra: package);
                },
              );
            },
          ),
        );
      },
    );
  }
}