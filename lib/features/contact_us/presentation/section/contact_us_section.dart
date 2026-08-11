import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';

class ContactUsSection extends StatefulWidget {
  final Function(String name, String email, String message)? onSubmit;
  final bool isLoading;

  const ContactUsSection({
    super.key,
    this.onSubmit,
    this.isLoading = false,
  });

  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: 'الاسم',
              hintText: 'أحمد',
              controller: _nameController,
              suffixIcon: Icons.person_outline,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'يرجى إدخال الاسم';
                }
                return null;
              },
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'البريد الإلكتروني',
              hintText: 'Samerroghy988@gmail.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icons.email_outlined,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'يرجى إدخال البريد الإلكتروني';
                }
                return null;
              },
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'نص الرسالة',
              hintText: 'هنا نكتب نص الرسالة',
              controller: _messageController,
              maxLines: 3,
              suffixIcon: Icons.edit_outlined,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'يرجى كتابة الرسالة';
                }
                return null;
              },
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 28),
            widget.isLoading
                ? const Center(child: CircularProgressIndicator())
                : AppButton(
                    label: 'إرسال',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit?.call(
                          _nameController.text.trim(),
                          _emailController.text.trim(),
                          _messageController.text.trim(),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}