import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/app_hint_section.dart';

const int _maxImages = 5;

class AddImagesSection extends StatelessWidget {
  const AddImagesSection({super.key});

  Future<void> _pickImages(BuildContext context, int remainingSlots) async {
    if (remainingSlots <= 0) return;

    final picker = ImagePicker();
    final picked = await picker.pickMultiImage(limit: remainingSlots);
    if (picked.isEmpty) return;

    final bloc = context.read<AddAdBloc>();
    for (final file in picked.take(remainingSlots)) {
      bloc.add(AddImageEvent(file.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdBloc, AddAdState>(
      builder: (context, state) {
        final totalCount =
            state.existingImageUrls.length + state.localImagePaths.length;
        final remainingSlots = _maxImages - totalCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('أضف صورآ لإعلانك', style: AppTextStyle.headline3),
            const SizedBox(height: 12),
            if (totalCount > 0) ...[
              _ImagesGrid(
                existingImageUrls: state.existingImageUrls,
                localImagePaths: state.localImagePaths,
              ),
              const SizedBox(height: 12),
            ],
            if (remainingSlots > 0)
              GestureDetector(
                onTap: () => _pickImages(context, remainingSlots),
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
                          style: AppTextStyle.buttonText
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        const SizedBox(height: 4),
                        Text('باقي $remainingSlots من $_maxImages صور',
                            style: AppTextStyle.textFieldHeader),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            const AppHintSection(
              title:
                  "💡 نصيحة : الصور المتعددة والمتنوعة تزيد من فرص بيع إعلانك بنسبة 70 %",
            ),
          ],
        );
      },
    );
  }
}

class _ImagesGrid extends StatelessWidget {
  final List<String> existingImageUrls;
  final List<String> localImagePaths;

  const _ImagesGrid({
    required this.existingImageUrls,
    required this.localImagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: existingImageUrls.length + localImagePaths.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final isExisting = index < existingImageUrls.length;

        final image = isExisting
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  existingImageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.backgroundColor,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(localImagePaths[index - existingImageUrls.length]),
                  fit: BoxFit.cover,
                ),
              );

        return Stack(
          children: [
            Positioned.fill(child: image),
            // الصور القديمة (existing) مش قابلة للحذف من هنا -- مفيش
            // endpoint بيمسح صورة بعينها من إعلان قائم لحد دلوقتي.
            if (!isExisting)
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => context.read<AddAdBloc>().add(
                        RemoveImageEvent(index - existingImageUrls.length),
                      ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close,
                        size: 14, color: Colors.white),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}