import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class HomeBannerSection extends StatefulWidget {
  const HomeBannerSection({super.key});

  @override
  State<HomeBannerSection> createState() => _HomeBannerSectionState();
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  int _currentIndex = 0;

  final List<String> _banners = [
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 136,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CarouselSlider.builder(
          itemCount: _banners.length,
          itemBuilder: (context, index, _) {
            return Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        _banners[index],
                        height: 136,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 12,
                        top: 0,
                        bottom: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("مستخدم",
                                style: AppTextStyle.textBannerHeadline1),
                            Text("بيع وإشترى بسهولة وآمان",
                                style: AppTextStyle.textBannerHeadline2),
                          ],
                        ),
                      ),
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
            _banners.length,
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
    ]);
  }
}
