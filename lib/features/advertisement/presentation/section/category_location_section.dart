import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

class CategoryLocationSection extends StatefulWidget {
    final AdDetailsModel? ad;

  const CategoryLocationSection({super.key, this.ad});

  @override
  State<CategoryLocationSection> createState() =>
      _CategoryLocationSectionState();
}

class _CategoryLocationSectionState extends State<CategoryLocationSection> {
  String? _mainCategory;
  String? _subCategory;
  String? _city;

  @override
void initState() {
  super.initState();
  if (widget.ad != null) {
    _city = widget.ad!.city;
  }
}

  

  Widget _buildDropdown(
    String label,
    String hint,
    String? value,
    List<String> items,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textFieldLabel),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(hint, textAlign: TextAlign.right),
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: e,
                    child: Text(e, textAlign: TextAlign.right),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'التصنيف و الموقع',
          style: AppTextStyle.headline3,
        ),
        _buildDropdown(
          'التصنيف الرئيسي',
          'اختر التصنيف الرئيسي',
          _mainCategory,
          ['سيارات', 'أثاث', 'إلكترونيات', 'عقارات', 'أزياء'],
          (val) => setState(() => _mainCategory = val),
        ),
        _buildDropdown(
          'التصنيف الفرعي',
          'اختر التصنيف الفرعي',
          _subCategory,
          ['تويوتا', 'كيا', 'مرسيدس', 'هوندا'],
          (val) => setState(() => _subCategory = val),
        ),
        _buildDropdown(
          'الموقع',
          'اختر الموقع',
          _city,
          ['الرياض', 'جدة', 'مكة', 'الدمام'],
          (val) => setState(() => _city = val),
        ),
        AppHintSection(
            title:
                "💡 نصيحة : إختيار التصنيف يساعد المشترين فىالوصول إلى إعلانك بكل سهولة")
      ],
    );
  }
}
