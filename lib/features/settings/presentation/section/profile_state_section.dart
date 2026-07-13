import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/settings/presentation/widgets/profile_state_item.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileStatItem(
            count: '7',
            label: 'الإعلانات',
            icon: Icons.campaign_outlined,
          ),
          
          ProfileStatItem(
            count: '9',
            label: 'المبيعات الناجحة',
            icon: Icons.check_circle_outline,
          ),
          ProfileStatItem(
            count: '12',
            label: 'المتابعين',
            icon: Icons.people_outline,
          ),
        ],
      
    );
  }
}