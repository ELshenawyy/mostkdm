import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

// TODO: تأكد من القيم دي مع الباك اند -- عندنا مثال واحد بس مؤكد
// (whatsapp) من الكولكشن، الباقي تخمين منطقي.
class _ContactOption {
  final String value;
  final String title;
  final String subtitle;
  final IconData icon;

  const _ContactOption({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

const List<_ContactOption> _contactOptions = [
  _ContactOption(
    value: 'whatsapp',
    title: 'واتساب',
    subtitle: 'التواصل عبر واتساب',
    icon: Icons.sms_outlined,
  ),
  _ContactOption(
    value: 'chat',
    title: 'الرسائل',
    subtitle: 'إرسال رسائل داخل التطبيق',
    icon: Icons.message_outlined,
  ),
  _ContactOption(
    value: 'call',
    title: 'المكالمات الهاتفية',
    subtitle: 'التواصل المباشر بالهاتف',
    icon: Icons.call_outlined,
  ),
];

class ContactMethodsSection extends StatefulWidget {
  const ContactMethodsSection({super.key});

  @override
  State<ContactMethodsSection> createState() => _ContactMethodsSectionState();
}

class _ContactMethodsSectionState extends State<ContactMethodsSection> {
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(
      text: context.read<AddAdBloc>().state.connectionNumber,
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _notifyBloc(String connectionType) {
    context.read<AddAdBloc>().add(
          UpdateContactEvent(
            connectionType: connectionType,
            connectionNumber: _phoneController.text,
          ),
        );
  }

  Widget _buildContactOption({
    required _ContactOption option,
    required String? selectedValue,
  }) {
    final isSelected = option.value == selectedValue;
    return GestureDetector(
      onTap: () => _notifyBloc(option.value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            Icon(option.icon, color: AppColors.primaryColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(option.title,
                      style: AppTextStyle.headline2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor)),
                  Text(option.subtitle, style: AppTextStyle.textFieldHeader),
                ],
              ),
            ),
            
            Radio<String>(
              value: option.value,
              groupValue: selectedValue,
              activeColor: AppColors.primaryColor,
              onChanged: (v) {
                if (v != null) _notifyBloc(v);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdBloc, AddAdState>(
      buildWhen: (previous, current) =>
          previous.connectionType != current.connectionType,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('طرق التواصل المسموحة', style: AppTextStyle.headline3),
            const SizedBox(height: 12),
            AppTextField(
              label: 'رقم الجوال',
              controller: _phoneController,
              hintText: 'مثال  0514786748',
              keyboardType: TextInputType.phone,
              fillColor: AppColors.surface,
              onChanged: (_) => _notifyBloc(state.connectionType),
            ),
            const SizedBox(height: 16),
            ..._contactOptions.map(
              (option) => _buildContactOption(
                option: option,
                selectedValue:
                    state.connectionType.isEmpty ? null : state.connectionType,
              ),
            ),
            const SizedBox(height: 16),
            const AppHintSection(
              title: "💡 ملاحظة : رقمك آمن ولا يظهر إلا للمشترين المهتمين فقط",
            ),
          ],
        );
      },
    );
  }
}