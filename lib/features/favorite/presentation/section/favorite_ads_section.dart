import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
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
        if (state is FavoriteLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

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

        if (state is FavoriteLoaded) {
          if (state.favoriteAds.isEmpty) {
            return const FavoritesEmptySection();
          }
          final reversedList = state.favoriteAds.reversed.toList();

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: state.favoriteAds.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final ad = reversedList[i];
              

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
                onFavTap: () {
                  context.read<FavoritesBloc>().add(
                        ToggleFavoriteAdEvent(adId: ad.id, adItem: ad),
                      );
                },
                onTap: () => context.push(
                  RouteNames.adsDetails,
                  extra: ad.id,
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
