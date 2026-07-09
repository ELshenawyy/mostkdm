// features/add_ad/presentation/sections/contact_methods_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

class ContactMethodsSection extends StatefulWidget {
  const ContactMethodsSection({super.key});

  @override
  State<ContactMethodsSection> createState() => _ContactMethodsSectionState();
}

class _ContactMethodsSectionState extends State<ContactMethodsSection> {
  bool _whatsapp = false;
  bool _messages = false;
  bool _calls = false;
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildContactOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value
              ? AppColors.primaryColor
              : AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 24),
          const SizedBox(width: 12),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyle.headline2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor)),
                  Text(subtitle, style: AppTextStyle.textFieldHeader),
                ],
              ),
            ],
          ),
          Spacer(),
          Radio<bool>(
            value: true,
            groupValue: value,
            activeColor: AppColors.primaryColor,
            onChanged: (v) => onChanged(v ?? false),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طرق التواصل المسموحة',
          style: AppTextStyle.headline3,
        ),
        const SizedBox(height: 12),
        AppTextField(
          label: 'رقم الجوال',
          controller: _phoneController,
          hintText: 'مثال  0514786748',
          keyboardType: TextInputType.phone,
          fillColor: AppColors.surface,
        ),
        const SizedBox(height: 16),
        _buildContactOption(
          title: 'واتساب',
          subtitle: 'التواصل عبر واتساب',
          icon: Icons.sms_outlined,
          value: _whatsapp,
          onChanged: (v) => setState(() => _whatsapp = v),
        ),
        _buildContactOption(
          title: 'الرسائل',
          subtitle: 'إرسال رسائل داخل التطبيق',
          icon: Icons.message_outlined,
          value: _messages,
          onChanged: (v) => setState(() => _messages = v),
        ),
        _buildContactOption(
          title: 'المكالمات الهاتفية',
          subtitle: 'التواصل المباشر بالهاتف',
          icon: Icons.call_outlined,
          value: _calls,
          onChanged: (v) => setState(() => _calls = v),
        ),
        const SizedBox(height: 16),
        AppHintSection(
            title: "💡 ملاحظة : رقمك آمن ولا يظهر إلا للمشترين المهتمين فقط"),
      ],
    );
  }
}
