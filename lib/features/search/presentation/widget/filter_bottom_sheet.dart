import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? _mainCategory;
  String? _subCategory;
  String? _city;
  String? _adType;
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 24,),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: const Offset(0, -50),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: AppColors.secondaryColor, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: AppColors.secondaryColor,
                    size: 29,
                  ),
                ),
              ),
            ),
            Center(child: Text('فلتر حسب', style: AppTextStyle.headline1)),
            const SizedBox(height: 16),
            _buildDropdown(
                'القسم الرئيسي',
                'سيارة',
                _mainCategory,
                ['سيارات', 'أثاث', 'إلكترونيات'],
                (val) => setState(() => _mainCategory = val)),
            const SizedBox(height: 12),
            _buildDropdown(
                'القسم الفرعي',
                'تويوتا',
                _subCategory,
                ['تويوتا', 'كيا', 'مرسيدس'],
                (val) => setState(() => _subCategory = val)),
            const SizedBox(height: 12),
            _buildDropdown(
                'المدينة',
                'جدة',
                _city,
                ['جدة', 'الرياض', 'مكة'],
                (val) => setState(() => _city = val)),
            const SizedBox(height: 12),
            _buildDropdown('نوع الإعلان', 'مميز', _adType, ['مميز', 'عادي'],
                (val) => setState(() => _adType = val)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _buildPriceField('إلى (ريال)', _toController)),
                const SizedBox(width: 12),
                Expanded(
                    child: _buildPriceField('من (ريال)', _fromController)),
              ],
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'أظهر النتائج',
              kind: AppButtonKind.secondary,
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
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
        const SizedBox(height: 6),
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
          ),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildPriceField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textFieldLabel),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: '0',
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}