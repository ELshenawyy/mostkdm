import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/settings/presentation/section/more_list_section.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(
              height: 160,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(
                      title: 'المزيد',
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MoreListSection(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
