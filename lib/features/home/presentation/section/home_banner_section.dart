import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/home/data/models/slider_model.dart';

class HomeBannerSection extends StatefulWidget {
  final List<SliderModel> sliders;

  const HomeBannerSection({super.key, required this.sliders});

  @override
  State<HomeBannerSection> createState() => _HomeBannerSectionState();
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sliders.isEmpty) {
      return const _DefaultPromoBanner();
    }

    return Stack(
      children: [
        Container(
          height: 136,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CarouselSlider.builder(
            itemCount: widget.sliders.length,
            itemBuilder: (context, index, _) {
              final slider = widget.sliders[index];
              return Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: slider.image,
                    height: 136,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 136,
                      color: AppColors.backgroundColor,
                    ),
                    errorWidget: (context, url, error) => const _DefaultPromoBanner(),
                  ),
                  Positioned(
                    right: 12,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(slider.name,
                            style: AppTextStyle.textBannerHeadline1),
                        if (slider.description != null)
                          Text(slider.description!,
                              style: AppTextStyle.textBannerHeadline2),
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: 136,
              viewportFraction: 1,
              autoPlay: true,
              padEnds: false,
              onPageChanged: (i, _) => setState(() => _currentIndex = i),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.sliders.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: _currentIndex == i ? 14 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == i
                      ? AppColors.surface
                      : AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DefaultPromoBanner extends StatelessWidget {
  const _DefaultPromoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'بيع وإشتري بسهولة وأمان',
                  style: AppTextStyle.textBannerHeadline1,
                ),
                const SizedBox(height: 6),
                Text(
                  'انضم لآلاف المستخدمين اليوم',
                  style: AppTextStyle.textBannerHeadline2,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.storefront_outlined,
            color: AppColors.surface,
            size: 48,
          ),
        ],
      ),
    );
  }
}