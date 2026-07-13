import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';

class EditProfileFormSection extends StatefulWidget {
  const EditProfileFormSection({super.key});

  @override
  State<EditProfileFormSection> createState() => _EditProfileFormSectionState();
}

class _EditProfileFormSectionState extends State<EditProfileFormSection> {
  final _nameController = TextEditingController(text: 'أحمد');
  final _bioController = TextEditingController();
  final _phoneController = TextEditingController(text: '050000000');
  final _emailController =
      TextEditingController(text: 'samrmoghazy777@gmail.com');
  final _locationController = TextEditingController(text: 'الرياض، السعودية');

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 80,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AppTextField(
            label: 'الاسم',
            controller: _nameController,
            fillColor: AppColors.surface,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'وصف النشاط',
            controller: _bioController,
            hintText: 'هنا يذهب وصف النشاط',
            fillColor: AppColors.surface,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'رقم الجوال',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            fillColor: AppColors.surface,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'البريد الإلكتروني',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            fillColor: AppColors.primaryColor.withValues(alpha: 0.05),
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'الموقع',
            controller: _locationController,
            fillColor: AppColors.surface,
          ),
          const SizedBox(height: 24),
          AppButton(
            label: 'حفظ وتعديل',
            onTap: () {},
            kind: AppButtonKind.secondary,
          ),
        ],
      ),
    );
  }
}
