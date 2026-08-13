import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/subscription/presentation/bloc/packages_bloc.dart';
import 'package:mostkdm/features/subscription/presentation/sections/subscriptions_list_section.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<PackagesBloc>()..add(GetPackagesEvent()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppHeader(
                height: 120,
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: LocalAppBar(
                          title: 'الباقات والإشتراكات',
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SubscriptionsListSection(),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
