import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

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
        key: ValueKey(widget.images[index]),
        height: 350,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: widget.images[index],
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.backgroundColor,
            child: const Icon(Icons.image_not_supported_outlined, size: 40),
          ),
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
