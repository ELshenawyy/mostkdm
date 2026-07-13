import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class AppTextField extends StatefulWidget {
  
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? suffixIcon;
  final String? hintText;
  final Color? fillColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.fillColor,
    this.maxLines,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyle.textFieldHeader,
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.isPassword && _obscure,
          keyboardType: widget.keyboardType,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? AppColors.backgroundColor,
            hintText: widget.hintText,
            hintStyle: AppTextStyle.textFieldLabel
                .copyWith(decoration: TextDecoration.none),
            hintTextDirection: TextDirection.rtl,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 25,
            ),
            suffixIcon: Icon(
              widget.suffixIcon,
              color: AppColors.secondaryColor,
              size: 20,
            ),
            prefixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () => setState(() => _obscure = !_obscure),
                    child: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.secondaryColor,
                      size: 20,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.secondaryColor.withOpacity(0.10),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
