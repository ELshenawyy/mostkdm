import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/features/favorite/data/model/following_dummy_data.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/follow_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/widget/following_user_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/favorite/presentation/section/favorites_empty_section.dart';

class FollowingUsersSection extends StatelessWidget {
  const FollowingUsersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowBloc, FollowState>(
      builder: (context, state) {
        final isLoading = state is FollowLoading;

        if (state is FollowError) {
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
                      context.read<FollowBloc>().add(const GetFollowersEvent());
                    },
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is FollowLoaded || isLoading) {
          final usersList = isLoading
              ? FollowingDummyData.dummySellersList
              : (state as FollowLoaded).followersList;

          if (!isLoading && usersList.isEmpty) {
            return const FavoritesEmptySection();
          }

          return Skeletonizer(
            enabled: isLoading,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: usersList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final seller = usersList[i];

                return GestureDetector(
                  onTap: isLoading
                      ? null
                      : () => context.push(
                            RouteNames.profile,
                            extra: seller.id,
                          ),
                  child: FollowingUserCard(
                    name: seller.name,
                    adsCount: seller.adsCount,
                    userImage: seller.image,
                    onUnfollow: isLoading
                        ? null
                        : () {
                            context.read<FollowBloc>().add(
                                  ToggleFollowEvent(userId: seller.id),
                                );
                          },
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