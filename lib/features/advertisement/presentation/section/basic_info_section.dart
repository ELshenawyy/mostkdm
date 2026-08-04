import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

class BasicInfoSection extends StatefulWidget {
  const BasicInfoSection({super.key});

  @override
  State<BasicInfoSection> createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    // نبدأ بالقيم الحالية في الـ Bloc -- مهمة في وضع التعديل، لو
    // PrefillFromAdEvent اتبعتت قبل ما الخطوة دي تتفتح.
    final state = context.read<AddAdBloc>().state;
    _titleController = TextEditingController(text: state.title);
    _descriptionController = TextEditingController(text: state.description);
    _priceController = TextEditingController(text: state.price);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _notifyBloc() {
    context.read<AddAdBloc>().add(
          UpdateBasicInfoEvent(
            title: _titleController.text,
            description: _descriptionController.text,
            price: _priceController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('المعلومات الأساسية', style: AppTextStyle.headline3),
        const SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          label: 'عنوان الإعلان',
          controller: _titleController,
          hintText: 'مثال: سيارة تويوتا 2023',
          onChanged: (_) => _notifyBloc(),
        ),
        const SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          maxLines: 4,
          label: 'الوصف',
          controller: _descriptionController,
          hintText: 'اكتب وصفاً تفصيلياً للإعلان',
          onChanged: (_) => _notifyBloc(),
        ),
        const SizedBox(height: 16),
        AppTextField(
          fillColor: AppColors.surface,
          label: 'السعر',
          controller: _priceController,
          hintText: '0',
          keyboardType: TextInputType.number,
          onChanged: (_) => _notifyBloc(),
        ),
        const SizedBox(height: 16),
        const AppHintSection(
          title:
              "💡 نصيحة : العنوان الواضح والوصف المفصل يزيدان من فرص بيع إعلانك",
        ),
      ],
    );
  }
}