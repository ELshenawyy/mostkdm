import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/settings/presentation/section/edit_profile_form_section.dart';
import 'package:mostkdm/features/settings/presentation/widgets/profile_avatar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5EF),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              AppHeader(
                height: 170,
                child: Column(
                  children: [
                    const LocalAppBar(
                      title: 'تعديل الملف الشخصي',
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: 120,
            left: 16,
            right: 16,
            bottom: 0,
            child: SingleChildScrollView(
              child: const EditProfileFormSection(),
            ),
          ),

          const Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: ProfileAvatar(),
          ),
        ],
      ),
    );
  }
}
