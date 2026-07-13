import 'package:flutter/material.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/features/settings/presentation/section/profile_info_section.dart';
import 'package:mostkdm/features/settings/presentation/section/profile_state_section.dart';
import 'package:mostkdm/features/settings/presentation/section/profile_subscription_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 160,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(
                      title: 'الملف الشخصي',
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const ProfileInfoSection(),
                    const SizedBox(height: 16),
                    const ProfileStatsSection(),
                    const SizedBox(height: 16),
                    const ProfileSubscriptionSection(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
