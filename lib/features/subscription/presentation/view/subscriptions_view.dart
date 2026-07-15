// features/subscriptions/presentation/view/subscriptions_view.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/subscription/presentation/sections/subscriptions_list_section.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 120,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(
                      title: 'الباقات والإشتراكات',
                      isLight: true,
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
    );
  }
}