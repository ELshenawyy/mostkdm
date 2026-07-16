import 'package:flutter/material.dart';
import 'package:mostkdm/features/favorite/presentation/section/favorites_empty_section.dart';
import 'package:mostkdm/features/favorite/presentation/widget/following_user_card.dart';

class FollowingUsersSection extends StatefulWidget {
  const FollowingUsersSection({super.key});

  @override
  State<FollowingUsersSection> createState() => _FollowingUsersSectionState();
}

class _FollowingUsersSectionState extends State<FollowingUsersSection> {
  final List<Map<String, dynamic>> _users = [
    {'name': 'أحمد محمد', 'adsCount': 11},
    {'name': 'علاء إبراهيم', 'adsCount': 15},
    {'name': 'أحمد محمد', 'adsCount': 12},
    {'name': 'أحمد محمد', 'adsCount': 7},
  ];

  @override
  Widget build(BuildContext context) {
    if (_users.isEmpty) return const SizedBox();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) => FollowingUserCard(
        name: _users[i]['name'],
        adsCount: _users[i]['adsCount'],
        onUnfollow: () => setState(() => _users.removeAt(i)),
      ),
    );
  }
}
