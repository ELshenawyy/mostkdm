import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AdSlider extends StatefulWidget {
  final List<String> images;
  final void Function(int) onPageChanged;

  const AdSlider({
    super.key,
    required this.images,
    required this.onPageChanged,
  });

  @override
  State<AdSlider> createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
  @override
  Widget build(BuildContext context) {
    // 1. معرفة هل الـ Skeletonizer نشط حالياً أم لا
    final isSkeletonEnabled = Skeletonizer.of(context).enabled;

    // 2. إذا كنا في حالة Skeleton أو القائمة فاضية، نضمن عرض عنصر واحد على الأقل للـ Shimmer
    final effectiveItemCount =
        (isSkeletonEnabled || widget.images.isEmpty) ? 1 : widget.images.length;

    return CarouselSlider.builder(
      itemCount: effectiveItemCount,
      itemBuilder: (context, index, _) {
        // حالة الـ Skeleton أو عدم وجود صور: نعرض Container رمادي بدون أي Network Call
        if (isSkeletonEnabled || widget.images.isEmpty) {
          return Container(
            height: 350,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Icon(
              Icons.image,
              size: 50,
              color: Colors.white54,
            ),
          );
        }

        final imageUrl = widget.images[index];
        final isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

        // إذا كان الرابط غير صالح (Empty or Invalid URI)
        if (!isValidUrl) {
          return Container(
            height: 350,
            width: double.infinity,
            color: AppColors.backgroundColor,
            child: const Icon(
              Icons.image_not_supported_outlined,
              size: 40,
            ),
          );
        }

        // الحالة الطبيعية عند نجاح التحميل ووفرة الرابط
        return SizedBox(
          key: ValueKey(imageUrl),
          height: 350,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[200],
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColors.backgroundColor,
              child: const Icon(
                Icons.image_not_supported_outlined,
                size: 40,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 350,
        viewportFraction: 1,
        autoPlay: !isSkeletonEnabled && widget.images.length > 1, // إيقاف التناقل التلقائي أثناء الـ Skeleton
        onPageChanged: (i, _) {
          if (!isSkeletonEnabled) {
            widget.onPageChanged(i);
          }
        },
      ),
    );
  }
}