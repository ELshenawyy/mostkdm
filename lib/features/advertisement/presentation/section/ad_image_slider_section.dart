import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/ad_slider.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/ad_slider_overlay.dart';

class AdImageSliderSection extends StatefulWidget {
  final AdDetailsModel ad;

  const AdImageSliderSection({super.key, required this.ad});

  @override
  State<AdImageSliderSection> createState() => _AdImageSliderSectionState();
}

class _AdImageSliderSectionState extends State<AdImageSliderSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
        child: Stack(
          children: [
            AdSlider(
              images: widget.ad.images,
              onPageChanged: (i) => setState(() => _currentIndex = i),
            ),
            AdSliderOverlay(
              isPremium: widget.ad.isPremium,
              isFavorite: widget.ad.isFavorite,
              imageCount: widget.ad.images.length,
              currentIndex: _currentIndex,
              onBack: () => context.pop(),
              onFavorite: () {},
            ),
          ],
        ),
      ),
    );
  }
}
