import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';

class CategoryLocationSection extends StatefulWidget {
  const CategoryLocationSection({super.key});

  @override
  State<CategoryLocationSection> createState() =>
      _CategoryLocationSectionState();
}

class _CategoryLocationSectionState extends State<CategoryLocationSection> {
  @override
  void initState() {
    super.initState();
    // نجيب الأقسام + المدن مرة واحدة أول ما الخطوة تفتح. لو المستخدم
    // كان مختار قسم رئيسي بالفعل (رجع من خطوة تانية)، نجيب أقسامه
    // الفرعية كمان.
    final bloc = context.read<AddAdBloc>();
    bloc.add(const LoadLookupDataEvent());
    final categoryId = bloc.state.categoryId;
    if (categoryId != null) {
      bloc.add(LoadSubCategoriesForCategoryEvent(categoryId));
    }
  }

  Widget _buildDropdown<T>({
    required String label,
    required String hint,
    required T? value,
    required List<T> items,
    required String Function(T) itemLabel,
    required void Function(T?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textFieldLabel),
        const SizedBox(height: 12),
        DropdownButtonFormField<T>(
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
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: e,
                    child: Text(itemLabel(e), textAlign: TextAlign.right),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdBloc, AddAdState>(
      builder: (context, state) {
        final selectedCategory = state.categoryId == null
            ? null
            : state.categories
                .where((c) => c.id == state.categoryId)
                .firstOrNull;
        final selectedSubCategory = state.subCategoryId == null
            ? null
            : state.subCategories
                .where((c) => c.id == state.subCategoryId)
                .firstOrNull;
        final selectedCity = state.cityId == null
            ? null
            : state.cities.where((c) => c.id == state.cityId).firstOrNull;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text('التصنيف و الموقع', style: AppTextStyle.headline3),
            _buildDropdown<CategoryModel>(
              label: 'التصنيف الرئيسي',
              hint: 'اختر التصنيف الرئيسي',
              value: selectedCategory,
              items: state.categories,
              itemLabel: (c) => c.name,
              onChanged: (category) {
                if (category == null) return;
                context.read<AddAdBloc>().add(
                      UpdateCategoryEvent(categoryId: category.id),
                    );
                context
                    .read<AddAdBloc>()
                    .add(LoadSubCategoriesForCategoryEvent(category.id));
              },
            ),
            _buildDropdown<CategoryModel>(
              label: 'التصنيف الفرعي',
              hint: state.categoryId == null
                  ? 'اختر التصنيف الرئيسي أولاً'
                  : 'اختر التصنيف الفرعي',
              value: selectedSubCategory,
              items: state.subCategories,
              itemLabel: (c) => c.name,
              onChanged: state.categoryId == null
                  ? (_) {}
                  : (subCategory) {
                      if (subCategory == null || state.categoryId == null) {
                        return;
                      }
                      context.read<AddAdBloc>().add(
                            UpdateCategoryEvent(
                              categoryId: state.categoryId!,
                              subCategoryId: subCategory.id,
                            ),
                          );
                    },
            ),
            _buildDropdown<CityModel>(
              label: 'الموقع',
              hint: 'اختر الموقع',
              value: selectedCity,
              items: state.cities,
              itemLabel: (c) => c.name,
              onChanged: (city) {
                if (city == null) return;
                context.read<AddAdBloc>().add(
                      UpdateLocationEvent(
                        location: city.name,
                        cityId: city.id,
                      ),
                    );
              },
            ),
            const AppHintSection(
              title:
                  "💡 نصيحة : إختيار التصنيف يساعد المشترين فى الوصول إلى إعلانك بكل سهولة",
            ),
          ],
        );
      },
    );
  }
}