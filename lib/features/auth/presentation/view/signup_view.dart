import 'package:flutter/material.dart';
import 'package:mostkdm/features/auth/presentation/sections/signup_form_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/signup_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/signup_navigation_section.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignupHeaderSection(),
              SignupFormSection(),
              SignupNavigationSection(),
            ],
          ),
        ),
      ),
    );
  }
}
