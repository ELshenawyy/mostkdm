import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<CategoryModel> _categories = [];
  List<CategoryModel> _subCategories = [];
  List<CityModel> _cities = [];
  bool _optionsLoaded = false;

  CategoryModel? _selectedCategory;
  CategoryModel? _selectedSubCategory;
  CityModel? _selectedCity;
  // null = أي نوع (no filter sent), true = مميز, false = عادي
  bool? _isFeatured;

  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  static const List<_AdTypeOption> _adTypeOptions = [
    _AdTypeOption(label: 'مميز', value: true),
    _AdTypeOption(label: 'عادي', value: false),
  ];

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(const LoadFilterOptionsEvent());
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _onCategoryChanged(CategoryModel? category) {
    setState(() {
      _selectedCategory = category;
      _selectedSubCategory = null;
      _subCategories = [];
    });
    if (category != null) {
      context.read<SearchBloc>().add(LoadSubCategoriesEvent(category.id));
    }
  }

  void _applyFilter() {
    context.read<SearchBloc>().add(
          ApplyFilterEvent(
            categoryId: _selectedCategory?.id,
            subCategoryId: _selectedSubCategory?.id,
            cityId: _selectedCity?.id,
            isFeatured: _isFeatured,
            priceFrom: double.tryParse(_fromController.text),
            priceTo: double.tryParse(_toController.text),
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (previous, current) =>
          current is FilterOptionsLoaded || current is SubCategoriesLoaded,
      listener: (context, state) {
        if (state is FilterOptionsLoaded) {
          setState(() {
            _categories = state.categories;
            _cities = state.cities;
            _optionsLoaded = true;
          });
        } else if (state is SubCategoriesLoaded) {
          setState(() => _subCategories = state.subCategories);
        }
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 24),
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
              if (!_optionsLoaded)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                )
              else ...[
                _buildDropdown<CategoryModel>(
                  label: 'القسم الرئيسي',
                  hint: 'اختر القسم الرئيسي',
                  value: _selectedCategory,
                  items: _categories,
                  itemLabel: (c) => c.name,
                  onChanged: _onCategoryChanged,
                ),
                const SizedBox(height: 12),
                _buildDropdown<CategoryModel>(
                  label: 'القسم الفرعي',
                  hint: _selectedCategory == null
                      ? 'اختر القسم الرئيسي أولاً'
                      : 'اختر القسم الفرعي',
                  value: _selectedSubCategory,
                  items: _subCategories,
                  itemLabel: (c) => c.name,
                  onChanged: _selectedCategory == null
                      ? null
                      : (val) => setState(() => _selectedSubCategory = val),
                ),
                const SizedBox(height: 12),
                _buildDropdown<CityModel>(
                  label: 'المدينة',
                  hint: 'اختر المدينة',
                  value: _selectedCity,
                  items: _cities,
                  itemLabel: (c) => c.name,
                  onChanged: (val) => setState(() => _selectedCity = val),
                ),
                const SizedBox(height: 12),
                _buildDropdown<_AdTypeOption>(
                  label: 'نوع الإعلان',
                  hint: 'اختر نوع الإعلان',
                  value: _isFeatured == null
                      ? null
                      : _adTypeOptions
                          .firstWhere((o) => o.value == _isFeatured),
                  items: _adTypeOptions,
                  itemLabel: (o) => o.label,
                  onChanged: (val) =>
                      setState(() => _isFeatured = val?.value),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildPriceField('إلى (ريال)', _toController),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPriceField('من (ريال)', _fromController),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AppButton(
                  label: 'أظهر النتائج',
                  kind: AppButtonKind.secondary,
                  onTap: _applyFilter,
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required String hint,
    required T? value,
    required List<T> items,
    required String Function(T) itemLabel,
    required void Function(T?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textFieldLabel),
        const SizedBox(height: 6),
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
          ),
          items: items
              .map((e) =>
                  DropdownMenuItem(value: e, child: Text(itemLabel(e))))
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

class _AdTypeOption {
  final String label;
  final bool value;
  const _AdTypeOption({required this.label, required this.value});
}