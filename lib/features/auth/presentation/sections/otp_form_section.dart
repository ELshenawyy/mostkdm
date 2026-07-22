import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/utils/app_validator.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';

class OtpFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const OtpFormSection({super.key, required this.formKey});

  @override
  State<OtpFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<OtpFormSection> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            AppTextField(
              label: 'رقم الجوال',
              controller: _phoneController,
              suffixIcon: Icons.phone_outlined,
              hintText: '05xxxxxxxx',
              validator: AppValidators.phone,
            ),
            SizedBox(height: 14),
            AppButton(
              label: 'إرسال',
              isLoading: state is AuthLoading,
              kind: AppButtonKind.secondary,
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        ForgotPasswordEvent(phone: _phoneController.text),
                      );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
