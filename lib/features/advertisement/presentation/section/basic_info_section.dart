import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

class BasicInfoSection extends StatefulWidget {
  final AdDetailsModel? ad;

  const BasicInfoSection({super.key, this.ad});

  @override
  State<BasicInfoSection> createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.ad != null) {
      _titleController.text = widget.ad!.title;
      _descriptionController.text = widget.ad!.description;
      _priceController.text = widget.ad!.price.toString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المعلومات الأساسية',
          style: AppTextStyle.headline3,
        ),
        SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          label: 'عنوان الإعلان',
          controller: _titleController,
          hintText: 'مثال: سيارة تويوتا 2023',
        ),
        const SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          maxLines: 4,
          label: 'الوصف',
          controller: _descriptionController,
          hintText: 'اكتب وصفاً تفصيلياً للإعلان',
        ),
        const SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          label: 'السعر',
          controller: _priceController,
          hintText: '0',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        AppHintSection(
            title:
                "💡 نصيحة : العنوان الواضح والوصف المفصل يزيدان من فرض بيع إعلانك"),
      ],
    );
  }
}
