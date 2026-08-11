import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/follow_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/section/following_empty_section.dart';
import 'package:mostkdm/features/favorite/presentation/widget/following_user_card.dart';

class FollowingUsersSection extends StatelessWidget {
  const FollowingUsersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowBloc, FollowState>(
      builder: (context, state) {
        if (state is FollowLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

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
                      context.read<FollowBloc>().add(GetFollowersEvent());
                    },
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is FollowLoaded) {
          if (state.followersList.isEmpty) {
            return const FollowingEmptySection();
          }

          final reversedList = state.followersList.reversed.toList();

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: reversedList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final follower = reversedList[i];

              return FollowingUserCard(
                name: follower.name,
                adsCount: follower.adsCount,
                onUnfollow: () {
                  // إرسال الـ ID للـ Bloc للتحديث الفوري بدون setState
                  context
                      .read<FollowBloc>()
                      .add(ToggleFollowEvent(userId: follower.id));
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
