import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      AppTextField(
        label: 'الإسم',
        controller: _usernameController,
        suffixIcon: Icons.person_outlined,
        hintText: 'أحمد ',
      ),
      AppTextField(
        label: 'رقم الجوال',
        controller: _usernameController,
        suffixIcon: Icons.phone_outlined,
        hintText: '05xxxxxxxx',
      ),
      AppTextField(
        label: 'كلمة المرور',
        isPassword: true,
        controller: _passwordController,
        suffixIcon: Icons.lock_outlined,
        hintText: '********',
      ),
      AppTextField(
        label: 'تأكيد كلمة المرور',
        isPassword: true,
        controller: _passwordController,
        suffixIcon: Icons.lock_outlined,
        hintText: '********',
      ),
      SizedBox(height: 14),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('هل أنت موافق على الشروط والأحكام؟',
              style: AppTextStyle.forgetPasswordStyle),
        ],
      )
    ]);
  }
}
