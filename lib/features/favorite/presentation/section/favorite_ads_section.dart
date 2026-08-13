import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/utils/core_dummy_data.dart'; 
import 'package:mostkdm/core/widgets/app_ads_card.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_state.dart';
import 'package:mostkdm/features/favorite/presentation/section/favorites_empty_section.dart';

class FavoriteAdsSection extends StatelessWidget {
  const FavoriteAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoriteState>(
      builder: (context, state) {
        final isLoading = state is FavoriteLoading;

        if (state is FavoriteError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FavoritesBloc>().add(GetFavoritesEvent());
                    },
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is FavoriteLoaded || isLoading) {
          final adsList = isLoading
              ? CoreDummyData.dummyAdsList
              : (state as FavoriteLoaded).favoriteAds.reversed.toList();

          if (!isLoading && adsList.isEmpty) {
            return const FavoritesEmptySection();
          }

          return Skeletonizer(
            enabled: isLoading,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: adsList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final ad = adsList[i];

                return AppAdCard(
                  image: ad.cover.isNotEmpty
                      ? ad.cover
                      : (ad.images.isNotEmpty ? ad.images.first : ''),
                  title: ad.title,
                  price: ad.price.toString(),
                  location: ad.location,
                  date: 'منذ ${ad.daysAgo} يوم',
                  views: '${ad.visitedCount} مشاهدة',
                  isFavorite: true,
                  onFavTap: isLoading
                      ? null
                      : () {
                          context.read<FavoritesBloc>().add(
                                ToggleFavoriteAdEvent(adId: ad.id, adItem: ad),
                              );
                        },
                  onTap: isLoading
                      ? null
                      : () => context.push(
                            RouteNames.adsDetails,
                            extra: ad.id.toString(),
                          ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}