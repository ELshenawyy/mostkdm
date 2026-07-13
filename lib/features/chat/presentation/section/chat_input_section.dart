import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ChatInputSection extends StatefulWidget {
  const ChatInputSection({super.key});

  @override
  State<ChatInputSection> createState() => _ChatInputSectionState();
}

class _ChatInputSectionState extends State<ChatInputSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'اكتب الرسالة هنا...',
                hintTextDirection: TextDirection.rtl,
                hintStyle: AppTextStyle.textFieldLabel,
                filled: true,
                fillColor: AppColors.surface,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon:
                    const Icon(Icons.attach_file_outlined, color: AppColors.secondaryColor),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Icon(Icons.send, color: AppColors.surface, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
