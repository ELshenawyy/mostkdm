import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/ad_slider.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/ad_slider_overlay.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_state.dart';

class AdImageSliderSection extends StatefulWidget {
  final AdDetailsModel ad;

  const AdImageSliderSection({
    super.key,
    required this.ad,
  });

  @override
  State<AdImageSliderSection> createState() => _AdImageSliderSectionState();
}

class _AdImageSliderSectionState extends State<AdImageSliderSection> {
  int _currentIndex = 0;

  void _onFavoriteTapped(BuildContext context) {
    final int adId = int.tryParse(widget.ad.id) ?? 0;

    context.read<FavoritesBloc>().add(
          ToggleFavoriteAdEvent(
            adId: adId,
            adItem: widget.ad.toAdModel(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
        child: Stack(
          children: [
            AdSlider(
              images: widget.ad.images,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
            ),

            BlocBuilder<FavoritesBloc, FavoriteState>(
              builder: (context, state) {
                final int adId = int.tryParse(widget.ad.id) ?? 0;
                final bool isFav =
                    context.read<FavoritesBloc>().isFavorite(adId);

                return AdSliderOverlay(
                  isPremium: widget.ad.isPremium,
                  isFavorite: isFav,
                  imageCount: widget.ad.images.length,
                  currentIndex: _currentIndex,
                  onBack: () => context.pop(),
                  onFavorite: () => _onFavoriteTapped(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}