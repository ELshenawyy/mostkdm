// features/ad_details/presentation/widgets/ad_slider.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdSlider extends StatefulWidget {
  final List<String> images;
  final void Function(int) onPageChanged;

  const AdSlider(
      {super.key, required this.images, required this.onPageChanged});

  @override
  State<AdSlider> createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.images.length,
      itemBuilder: (context, index, _) => SizedBox(
        height: 350,
        width: double.infinity,
        child: Image.asset(
          widget.images[index],
          fit: BoxFit.cover,
        ),
      ),
      options: CarouselOptions(
        height: 350,
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (i, _) {
          widget.onPageChanged(i);
        },
      ),
    );
  }
}
