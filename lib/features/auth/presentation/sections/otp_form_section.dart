import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';

class OtpFormSection extends StatefulWidget {
  const OtpFormSection({super.key});

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
    return Column(children: [
      AppTextField(
        label: 'رقم الجوال',
        controller: _phoneController,
        suffixIcon: Icons.phone_outlined,
        hintText: '05xxxxxxxx',
      ),
  
      SizedBox(height: 14),

      
    ]);
  }
}
