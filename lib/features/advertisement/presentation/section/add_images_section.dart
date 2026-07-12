import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

class AddImagesSection extends StatefulWidget {
  final AdDetailsModel? ad;
  const AddImagesSection({super.key, this.ad});

  @override
  State<AddImagesSection> createState() => _AddImagesSectionState();
}

class _AddImagesSectionState extends State<AddImagesSection> {
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    if (widget.ad != null) {
      _images = List.from(widget.ad!.images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('أضف صورآ لإعلانك', style: AppTextStyle.headline3),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {},
          child: DottedBorder(
            color: AppColors.secondaryColor.withValues(alpha: .3),
            strokeWidth: 1.5,
            dashPattern: const [8, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.upload_outlined,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'اضغط لرفع الصور',
                    style: AppTextStyle.buttonText.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'حتى 5 صور',
                    style: AppTextStyle.textFieldHeader,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        AppHintSection(
            title:
                "💡 نصيحة : الصور المتعددة والمتنوعة تزيد من فرص بيع إعلانك بنسبة 70 %"),
      ],
    );
  }
}
